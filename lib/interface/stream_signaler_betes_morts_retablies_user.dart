// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/signaler_betes_morts_retablie_user.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/betes.dart';

class StreamVagueSignalerBetesMortsRetablieUser extends StatelessWidget {
  const StreamVagueSignalerBetesMortsRetablieUser({
    Key? key,
    required this.vague_uid,
  }) : super(key: key);
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_betes(vague_uid),
            initialData: <Betes>[]),
      ],
      child: SignalerBetesMortRetablieUser(vague_uid: vague_uid),
    );
  }
}

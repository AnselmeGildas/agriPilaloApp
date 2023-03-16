// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/interface/signaler_betes.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';

class StreamVagueSignalerBetes extends StatelessWidget {
  const StreamVagueSignalerBetes({super.key, required this.vague_uid});
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
            initialData: <Betes>[])
      ],
      child: SignalerBetes(vague_uid: vague_uid),
    );
  }
}

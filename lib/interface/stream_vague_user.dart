// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/vague_user.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueUser extends StatelessWidget {
  const StreamVagueUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) => context.read<serviceBD>().vague(vague_uid),
            initialData: Vagues(
                uid: vague_uid,
                nom: "",
                cloture: false,
                user_uid: "",
                description: "",
                created_at: "",
                created_at_heure: "",
                updated_att: "",
                updated_at_heure: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
      ],
      child: VagueUser(),
    );
  }
}

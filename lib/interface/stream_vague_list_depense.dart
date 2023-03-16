// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/liste_depense.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/depense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueListDepenses extends StatelessWidget {
  const StreamVagueListDepenses({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_depenses(vague_uid),
            initialData: <Depenses>[])
      ],
      child: ListeDepense(vague_uid: vague_uid),
    );
  }
}

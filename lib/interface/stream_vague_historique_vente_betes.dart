// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/historique_ventes_betes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/betes.dart';
import '../modele/budget_tiers.dart';
import '../modele/vente_betes.dart';

class StreamVagueHistoriqueVentesBetes extends StatelessWidget {
  const StreamVagueHistoriqueVentesBetes({super.key, required this.vague_uid});
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
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_vente_betes(vague_uid),
            initialData: <VenteBetes>[]),
      ],
      child: HistoriqueVentesBetes(
        vague_uid: vague_uid,
      ),
    );
  }
}

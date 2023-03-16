// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/historique_vente_fiente.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/budget_tiers.dart';
import '../modele/fientes.dart';

class StreamVagueHistoriqueVenteFiente extends StatelessWidget {
  const StreamVagueHistoriqueVenteFiente({super.key, required this.vague_uid});
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
                context.read<serviceBD>().list_vente_fiente(vague_uid),
            initialData: <VenteFientes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_fientes(vague_uid),
            initialData: <Fientes>[]),
      ],
      child: HistoriqueVentesFientes(
        vague_uid: vague_uid,
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/welcome_vague.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueForWelcome extends StatelessWidget {
  const StreamVagueForWelcome({super.key, required this.vague_uid});
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
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_oeuf_table(vague_uid),
            initialData: <OeufTables>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_fientes(vague_uid),
            initialData: <Fientes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_betes(vague_uid),
            initialData: <Betes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_vente_betes(vague_uid),
            initialData: <VenteBetes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_vente_fiente(vague_uid),
            initialData: <VenteFientes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_vente_oeufs_tables(vague_uid),
            initialData: <VenteOeufTables>[]),
      ],
      child: WelcomeVague(),
    );
  }
}

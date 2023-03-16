// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/interface/historique_vente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';
import '../modele/betes.dart';
import '../modele/fientes.dart';
import '../modele/oeuf_table.dart';
import '../modele/vente_betes.dart';
import '../modele/vente_oeuf_tables.dart';
import '../modele/ventes_fientes.dart';

class StreamVagueHistoriqueVente extends StatelessWidget {
  const StreamVagueHistoriqueVente({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_betes(vague_uid),
            initialData: <Betes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_fientes(vague_uid),
            initialData: <Fientes>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_oeuf_table(vague_uid),
            initialData: <OeufTables>[]),
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
      child: HistoriqueVente(
        vague_uid: vague_uid,
      ),
    );
  }
}

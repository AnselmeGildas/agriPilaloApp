// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/rubrique_stock.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/poussins.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/fientes.dart';

class StreamVagueRubriqueDesStocks extends StatelessWidget {
  const StreamVagueRubriqueDesStocks({super.key, required this.vague_uid});
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
                context.read<serviceBD>().list_poussins(vague_uid),
            initialData: <PoussinsUnJour>[]),
      ],
      child: RubriqueStocks(
        vague_uid: vague_uid,
      ),
    );
  }
}

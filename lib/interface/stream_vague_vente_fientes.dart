// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/vente_fiente.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueVentesFientes extends StatelessWidget {
  const StreamVagueVentesFientes({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_fientes(vague_uid),
            initialData: <Fientes>[])
      ],
      child: VenteDeFientes(
        vague_uid: vague_uid,
      ),
    );
  }
}

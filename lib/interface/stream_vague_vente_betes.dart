// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/interface/ventes_betes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';
import '../modele/betes.dart';

class StreamVagueVentesBetes extends StatelessWidget {
  const StreamVagueVentesBetes({super.key, required this.vague_uid});
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
      ],
      child: VenteDesBetes(
        vague_uid: vague_uid,
      ),
    );
  }
}

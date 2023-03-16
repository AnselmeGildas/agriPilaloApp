// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/liste_des_ventes_a_credits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/ventes_a_credits.dart';

class StreamVagueListVenteACredit extends StatelessWidget {
  const StreamVagueListVenteACredit({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_ventes_a_credits(vague_uid),
            initialData: <VentesACredits>[])
      ],
      child: ListeDesVentesACredits(vague_uid: vague_uid),
    );
  }
}

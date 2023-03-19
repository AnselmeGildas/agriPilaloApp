// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/list_des_ventes_a_credit_non_payes_user.dart';
import 'package:deogracias/modele/ventes_a_credits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueListDesVentesACreditsNonPayesUser extends StatelessWidget {
  const StreamVagueListDesVentesACreditsNonPayesUser(
      {super.key, required this.vague_uid});
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
      child: VentesACreditsNonPayesUser(vague_uid: vague_uid),
    );
  }
}

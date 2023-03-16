// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/liste_achats_poussins.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/achat_poussins.dart';

class StreamVagueAchatPoussinsEffectues extends StatelessWidget {
  const StreamVagueAchatPoussinsEffectues({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().achats_poussins(vague_uid),
            initialData: <AchatPoussins>[]),
      ],
      child: AchatsPoussinsEffectues(
        vague_uid: vague_uid,
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/stocks_betes_user.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueRechargerBetesUser extends StatelessWidget {
  const StreamVagueRechargerBetesUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_betes(vague_uid),
            initialData: <Betes>[])
      ],
      child: StockBetesUser(
        vague_uid: vague_uid,
      ),
    );
  }
}

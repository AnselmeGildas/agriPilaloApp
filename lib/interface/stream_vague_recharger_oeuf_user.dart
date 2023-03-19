// ignore_for_file: non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/stock_oeufs_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/oeuf_table.dart';

class StreamVagueRechargerOeufUser extends StatelessWidget {
  const StreamVagueRechargerOeufUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().oeuf_table(vague_uid),
            initialData: OeufTables(
                uid: "",
                user_uid: "",
                nom: "",
                nombre_initial: 0,
                nombre_restant: 0,
                nombre_casse: 0,
                prix_unitaire: 0,
                prix_unitaire_plateaux: 0,
                montant_vendu: 0,
                created_at: "")),
      ],
      child: StockOeufsUser(vague_uid: vague_uid),
    );
  }
}

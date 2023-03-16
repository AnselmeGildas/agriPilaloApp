// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/stock_du_fiente.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamStockFiente extends StatelessWidget {
  const StreamStockFiente(
      {super.key, required this.fiente_uid, required this.vague_uid});
  final String fiente_uid;
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().fiente(vague_uid, fiente_uid),
            initialData: Fientes(
                uid: fiente_uid,
                user_uid: "",
                nom: "",
                type_sack: "",
                created_at: "",
                prix_unitaire: 0,
                nombre_initial: 0,
                nombre_restant: 0,
                montant_vendu: 0))
      ],
      child: StockDuFiente(
        vague_uid: vague_uid,
      ),
    );
  }
}

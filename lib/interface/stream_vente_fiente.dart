// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/vente_de_fiente.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVenteFiente extends StatelessWidget {
  const StreamVenteFiente(
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
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().fiente(vague_uid, fiente_uid),
            initialData: Fientes(
                uid: "",
                user_uid: "",
                nom: "",
                type_sack: "",
                created_at: "",
                prix_unitaire: 0,
                nombre_initial: 0,
                nombre_restant: 0,
                montant_vendu: 0))
      ],
      child: VenteDeFiente(
        vague_uid: vague_uid,
      ),
    );
  }
}

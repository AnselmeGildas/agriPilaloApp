// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/vente_de_bete_user.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVenteBeteUser extends StatelessWidget {
  const StreamVenteBeteUser(
      {super.key, required this.bete_uid, required this.vague_uid});
  final String bete_uid;
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
                context.read<serviceBD>().bete(vague_uid, bete_uid),
            initialData: Betes(
                prix_unitaire: 0,
                uid: "",
                nom: "",
                user_uid: "",
                created_at: "",
                nombre_initial: 0,
                nombre_restant: 0,
                montant_vendu: 0,
                nombre_malade: 0,
                nombre_mort: 0,
                updated_at: ""))
      ],
      child: VenteDeBeteUser(
        vague_uid: vague_uid,
      ),
    );
  }
}

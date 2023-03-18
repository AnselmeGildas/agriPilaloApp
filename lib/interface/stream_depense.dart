// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/depense_effectue.dart';
import 'package:deogracias/modele/depense.dart';

class StreamDepense extends StatelessWidget {
  const StreamDepense({
    Key? key,
    required this.depense_uid,
    required this.user_uid,
    required this.vague_uid,
  }) : super(key: key);
  final String depense_uid;
  final String user_uid;
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
                context.read<serviceBD>().depense(vague_uid, depense_uid),
            initialData: Depenses(
                uid: depense_uid,
                user_uid: user_uid,
                created_at: "",
                created_at_heure: "",
                description: "",
                montant: 0)),
        StreamProvider(
            create: (context) => context.read<serviceBD>().user_data(user_uid),
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: user_uid,
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: DepenseEffectue(
        vague_uid: vague_uid,
      ),
    );
  }
}

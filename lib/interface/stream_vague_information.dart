// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/vague_information.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/user.dart';

class StreamVagueInformation extends StatelessWidget {
  const StreamVagueInformation(
      {super.key, required this.vague_uid, required this.user_uid});
  final String vague_uid;
  final String user_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
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
                uid: "",
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false)),
        StreamProvider(
            create: (context) => context.read<serviceBD>().vague(vague_uid),
            initialData: Vagues(
                uid: vague_uid,
                nom: "",
                cloture: false,
                user_uid: "",
                description: "",
                created_at: "",
                created_at_heure: "",
                updated_att: "",
                updated_at_heure: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
      ],
      child: VagueInformation(),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/probleme_employe.dart';
import 'package:deogracias/modele/problemes.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProbleme extends StatelessWidget {
  const StreamProbleme(
      {super.key, required this.probleme_uid, required this.probleme_user_uid});
  final String probleme_uid;
  final String probleme_user_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().probleme(probleme_uid),
            initialData: Problemes(
                uid: probleme_uid,
                description: "",
                created_at: "",
                created_at_heure: "",
                user_uid: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().user_data(probleme_user_uid),
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: probleme_user_uid,
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: ProblemeEmploye(),
    );
  }
}

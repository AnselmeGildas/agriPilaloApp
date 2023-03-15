// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/utilisateur_information.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamUtilisateur extends StatelessWidget {
  const StreamUtilisateur(
      {super.key, required this.utilisateur_uid, required this.user_password});
  final String utilisateur_uid;
  final String user_password;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().user_data(utilisateur_uid),
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: utilisateur_uid,
                photo_url: "",
                admin: false,
                is_active: false,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: UtilisateursInformation(
        user_password: user_password,
      ),
    );
  }
}

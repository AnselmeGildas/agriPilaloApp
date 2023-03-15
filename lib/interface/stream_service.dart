// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/sservice.dart';
import 'package:deogracias/modele/services.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamService extends StatelessWidget {
  const StreamService(
      {super.key, required this.service_uid, required this.user_uid});
  final String service_uid;
  final String user_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) => context.read<serviceBD>().service(service_uid),
            initialData: Services(
                uid: service_uid,
                user_uid: "",
                nom: "",
                description: "",
                titre: "",
                created_at: "",
                cretad_at_heure: "",
                photo: "",
                updated_at: "")),
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
      child: Service(),
    );
  }
}

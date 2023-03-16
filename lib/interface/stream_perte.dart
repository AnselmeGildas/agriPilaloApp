// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/perte_realise.dart';
import 'package:deogracias/modele/pertes.dart';
import 'package:deogracias/services/user.dart';

class StreamPerte extends StatelessWidget {
  const StreamPerte({
    Key? key,
    required this.perte_uid,
    required this.user_uid,
    required this.vague_uid,
  }) : super(key: key);
  final String perte_uid;
  final String user_uid;
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().perte(vague_uid, perte_uid),
            initialData: Pertes(
                uid: perte_uid,
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
      child: PerteRealise(
        vague_uid: vague_uid,
      ),
    );
  }
}

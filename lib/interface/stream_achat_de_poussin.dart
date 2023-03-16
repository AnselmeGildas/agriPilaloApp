// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/achat_du_poussin_effectue.dart';
import 'package:deogracias/modele/achat_poussins.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamDeAchatPoussinEffectue extends StatelessWidget {
  const StreamDeAchatPoussinEffectue(
      {super.key,
      required this.achat_poussin_uid,
      required this.user_uid,
      required this.vague_uid});
  final String achat_poussin_uid;
  final String user_uid;
  final String vague_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) => context
                .read<serviceBD>()
                .achat_poussin(vague_uid, achat_poussin_uid),
            initialData: AchatPoussins(
                uid: "",
                user_uid: user_uid,
                poussin_uid: "",
                cretaed_at: "",
                created_at_heure: "",
                origine: "",
                prix_unitare: 0,
                nombre: 0,
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
      child: AchatDePoussinEffectue(
        vague_uid: vague_uid,
      ),
    );
  }
}

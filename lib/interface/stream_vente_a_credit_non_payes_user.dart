// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/interface/vente_a_credit_non_paye_user.dart';
import 'package:deogracias/modele/ventes_a_credits.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';

class StreamVenteACreditNonPayeUser extends StatelessWidget {
  const StreamVenteACreditNonPayeUser(
      {super.key,
      required this.vente_a_credit_uid,
      required this.vente_a_credit_user_uid,
      required this.vague_uid});
  final String vente_a_credit_uid;
  final String vente_a_credit_user_uid;
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) => context
                .read<serviceBD>()
                .vente_a_credit(vague_uid, vente_a_credit_uid),
            initialData: VentesACredits(
                uid: vente_a_credit_uid,
                nom_client: "",
                achat_effectue: "",
                description: "",
                created_at: "",
                created_at_heure: "",
                updated_at: "",
                updated_at_heure: "",
                montant: 0,
                paye: false,
                user_uid: vente_a_credit_user_uid)),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().user_data(vente_a_credit_user_uid),
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: vente_a_credit_user_uid,
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: VenteACreditNonPayeUser(),
    );
  }
}

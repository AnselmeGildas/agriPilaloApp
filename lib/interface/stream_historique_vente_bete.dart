// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/historique_de_vente_de_bete.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/budget_tiers.dart';

class StreamHistoriqueVenteBete extends StatelessWidget {
  const StreamHistoriqueVenteBete(
      {super.key,
      required this.vente_uid,
      required this.bete_uid,
      required this.user_uid,
      required this.vague_uid});
  final String vente_uid;
  final String bete_uid;
  final String user_uid;
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().vente_bete(vague_uid, vente_uid),
            initialData: VenteBetes(
                bete_nom: "",
                uid: "",
                user_uid: user_uid,
                bete_uid: bete_uid,
                created_at: "",
                montant: 0,
                nombre: 0,
                annee: "",
                created_at_in_days: 0,
                created_at_heure: "",
                updated_at: "",
                updated_at_heure: "",
                updated: false)),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().bete(vague_uid, bete_uid),
            initialData: Betes(
                prix_unitaire: 0,
                uid: "",
                nom: "",
                user_uid: user_uid,
                created_at: "",
                nombre_initial: 0,
                nombre_restant: 2,
                montant_vendu: 0,
                nombre_malade: 0,
                nombre_mort: 0,
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
                uid: "",
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: HistoriqueDeVenteDeBete(
        vague_uid: vague_uid,
      ),
    );
  }
}

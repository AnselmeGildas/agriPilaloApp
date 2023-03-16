// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/historique_du_vente_de_fiente.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/budget_tiers.dart';

class StreamHistoriqueVenteFiente extends StatelessWidget {
  const StreamHistoriqueVenteFiente(
      {super.key,
      required this.vente_uid,
      required this.user_uid,
      required this.fiente_uid,
      required this.vague_uid});
  final String vente_uid;
  final String user_uid;
  final String fiente_uid;
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
                context.read<serviceBD>().vente_fiente(vague_uid, vente_uid),
            initialData: VenteFientes(
                uid: "",
                fiente_uid: "",
                user_uid: user_uid,
                created_at: "",
                montant: 0,
                nombre: 0,
                annee: "",
                created_at_in_days: 0,
                updated_at: "",
                updated_at_heure: "",
                updated: false,
                created_at_heure: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().fiente(vague_uid, fiente_uid),
            initialData: Fientes(
                uid: "",
                user_uid: "",
                nom: "",
                type_sack: "",
                created_at: "",
                prix_unitaire: 0,
                nombre_initial: 0,
                nombre_restant: 0,
                montant_vendu: 0)),
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
      child: HistoriqueDuVenteDeFiente(
        vague_uid: vague_uid,
      ),
    );
  }
}

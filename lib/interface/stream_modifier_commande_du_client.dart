// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/modele/client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/modifier_commande_du_client.dart';

class StreamModifierCommandeDuClient extends StatelessWidget {
  const StreamModifierCommandeDuClient({
    Key? key,
    required this.client_uid,
    required this.commande_uid,
  }) : super(key: key);
  final String client_uid;
  final String commande_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().commande(commande_uid),
            initialData: Commandes(
                heure_livraison: "",
                uid: commande_uid,
                achat: "",
                description: "",
                created_at: "",
                updated_at: "",
                date_livraison: "",
                created_at_heure: "",
                updated_at_heure: "",
                since: "",
                venir_chercher_commande: true,
                supporter_frais_transports: true,
                client_uid: client_uid,
                coordonnees_gps: "",
                indication: "",
                exigences: "",
                traite: true)),
        StreamProvider(
            create: (context) => context.read<serviceBD>().client(client_uid),
            initialData: Clients(
                nombre_commande: 0,
                uid: client_uid,
                email: client_uid,
                numero: "",
                nom: "",
                departement: "",
                commune: "",
                arrondissement: "",
                created_at: ""))
      ],
      child: ModifierCommandeDuClient(),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/commandes_du_client.dart';
import 'package:deogracias/modele/client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamDesCommandesDuClient extends StatelessWidget {
  const StreamDesCommandesDuClient({super.key, required this.client_uid});
  final String client_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().commandes_du_client(client_uid),
            initialData: <Commandes>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().client(client_uid),
            initialData: Clients(
                nombre_commande: 0,
                uid: client_uid,
                email: "",
                numero: "",
                nom: "",
                departement: "",
                commune: "",
                arrondissement: "",
                created_at: ""))
      ],
      child: CommandesDuClient(),
    );
  }
}

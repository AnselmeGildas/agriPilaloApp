// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/commandes_par_client.dart';
import 'package:deogracias/modele/client.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/commandes.dart';

class StreamCommandeDeCaqueClients extends StatelessWidget {
  const StreamCommandeDeCaqueClients({super.key, required this.client_uid});
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
                uid: client_uid,
                email: "",
                numero: "",
                nom: "",
                departement: "",
                commune: "",
                arrondissement: "",
                created_at: "",
                nombre_commande: 0))
      ],
      child: CommandesParClient(),
    );
  }
}

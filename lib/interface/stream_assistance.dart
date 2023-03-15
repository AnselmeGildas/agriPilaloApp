// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/assistance_au_client.dart';
import 'package:deogracias/modele/assistances.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamAssistanceAuClient extends StatelessWidget {
  const StreamAssistanceAuClient({super.key, required this.assistance_uid});
  final String assistance_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().assistance(assistance_uid),
            initialData: Assistances(
              nom: "",
              numero: "",
              email: "",
              uid: "",
              message: "",
              repondu: false,
              created_at: "",
              created_at_heure: "",
            ))
      ],
      child: AssistanceAuClient(),
    );
  }
}

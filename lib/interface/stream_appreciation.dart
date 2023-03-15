// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/appreciation_d_client.dart';
import 'package:deogracias/modele/appreciations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamAppreciation extends StatelessWidget {
  const StreamAppreciation({super.key, required this.appreciation_uid});
  final String appreciation_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().appreciation(appreciation_uid),
            initialData: Appreciations(
                uid: appreciation_uid,
                created_at: "",
                created_at_heure: "",
                appreciation: "",
                nom: "",
                suggestion: "",
                email: ""))
      ],
      child: AppreciationDuClient(),
    );
  }
}

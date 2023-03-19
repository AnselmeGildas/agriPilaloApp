// ignore_for_file: non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/enregistrer_une_perte_user.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamVagueEnregistrerPerteUser extends StatelessWidget {
  const StreamVagueEnregistrerPerteUser({super.key, required this.vague_uid});
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
      ],
      child: EnregistrerPerteUser(vague_uid: vague_uid),
    );
  }
}

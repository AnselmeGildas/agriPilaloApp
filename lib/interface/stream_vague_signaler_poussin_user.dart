// ignore_for_file: non_constant_identifier_names

import 'package:deogracias/interface/signaler_poussin_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';
import '../modele/budget_tiers.dart';
import '../modele/poussins.dart';

class StreamVagueSignalerPoussinUser extends StatelessWidget {
  const StreamVagueSignalerPoussinUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
        StreamProvider(
            create: (context) => context.read<serviceBD>().poussin(vague_uid),
            initialData: PoussinsUnJour(
                uid: "",
                user_uid: "",
                nom: "",
                created_at: "",
                updated_at: "",
                nombre_initial: 0,
                nombre_bon_etat: 0,
                nombre_malade: 0,
                nombre_mort: 0,
                total_achat: 0))
      ],
      child: SignalerPoussinUser(vague_uid: vague_uid),
    );
  }
}

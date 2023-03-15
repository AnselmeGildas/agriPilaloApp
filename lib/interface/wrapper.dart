// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, non_constant_identifier_names

import 'package:deogracias/interface/accoun_deleted.dart';
import 'package:deogracias/interface/accueil.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'loader.dart';
import 'welcome_admin.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Utilisateur?>(context);
    final user_data = Provider.of<donnesUtilisateur>(context);
    if (user == null) {
      return Accueil();
    } else {
      if (user_data.admin) return AccueilAdmin();
      if (user_data.is_active) return HomePage();
      if (user_data.deleted) return AccountDeleted();
    }
    return Loader();
  }
}

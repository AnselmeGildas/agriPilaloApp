// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderNouvelleVague with ChangeNotifier {
  bool _affiche = false;
  String _nom = "";
  String _description = "";

  bool get affiche {
    return _affiche;
  }

  String get nom {
    return _nom;
  }

  String get description {
    return _description;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_nom(String? value, TextEditingController nom_vague) {
    _nom = value!;
    nom_vague.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_vague.selection);
    notifyListeners();
  }

  void change_description(String? value) {
    _description = value!;
    notifyListeners();
  }
}

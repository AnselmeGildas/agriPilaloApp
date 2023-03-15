// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderApprecierNosServices with ChangeNotifier {
  bool _affiche = false;
  String _nom = "";
  String _email = "";
  String _appreciation = "";
  String _suggestion = "";

  bool get affiche {
    return _affiche;
  }

  String get nom {
    return _nom;
  }

  String get email {
    return _email;
  }

  String get appreciation {
    return _appreciation;
  }

  String get suggestion {
    return _suggestion;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_nom(String? value, TextEditingController nom_user) {
    _nom = value!;
    nom_user.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_user.selection);
    notifyListeners();
  }

  void change_email(String? value) {
    _email = value!;
    notifyListeners();
  }

  void change_appreciation(String? value) {
    _appreciation = value!;
    notifyListeners();
  }

  void change_suggestion(String? value) {
    _suggestion = value!;
    notifyListeners();
  }
}

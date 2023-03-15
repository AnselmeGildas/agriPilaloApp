// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderAssistance with ChangeNotifier {
  bool _affiche = false;
  String _email = "";
  String _message = "";
  String _nom = "";
  String _numero = "";

  String get numero {
    return _numero;
  }

  String get nom {
    return _nom;
  }

  bool get affiche {
    return _affiche;
  }

  String get email {
    return _email;
  }

  String get messgae {
    return _message;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_numero(String? value) {
    _numero = value!;
    notifyListeners();
  }

  void change_nom(String? value, TextEditingController nom_utilisateur) {
    _nom = value!;
    nom_utilisateur.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_utilisateur.selection);
    notifyListeners();
  }

  void change_email(String? value) {
    _email = value!;
    notifyListeners();
  }

  void change_message(String? value) {
    _message = value!;
    notifyListeners();
  }
}

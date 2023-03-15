// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderVenteACredit with ChangeNotifier {
  bool _affiche = false;
  String _nom = "";
  String _achat = "";
  String _description = "";
  String _montant = "";

  bool get affiche {
    return _affiche;
  }

  String get montant {
    return _montant;
  }

  String get nom {
    return _nom;
  }

  String get achat {
    return _achat;
  }

  String get description {
    return _description;
  }

  void change_nom(String? value, TextEditingController nom_client_saisie) {
    _nom = value!;
    nom_client_saisie.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_client_saisie.selection);
    notifyListeners();
  }

  void change_achat(String? value) {
    _achat = value!;
    notifyListeners();
  }

  void change_montant(String? value) {
    _montant = value!;
    notifyListeners();
  }

  void change_description(String? value) {
    _description = value!;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }
}

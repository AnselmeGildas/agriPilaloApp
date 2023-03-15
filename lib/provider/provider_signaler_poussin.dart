// ignore_for_file: non_constant_identifier_n, non_constant_identifier_names
import 'package:flutter/material.dart';

class ProviderSignalerPoussin with ChangeNotifier {
  bool _affiche = false;
  String _nombre = "";
  bool _mort = false;
  String _montant = "";
  String _description = "";

  String get description {
    return _description;
  }

  void change_description(String? value) {
    _description = value!;
    notifyListeners();
  }

  String get montant {
    return _montant;
  }

  void change_montant(String? value) {
    _montant = value!;
    notifyListeners();
  }

  bool get affiche {
    return _affiche;
  }

  bool get mort {
    return _mort;
  }

  String get nombre {
    return _nombre;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_mort(bool? value) {
    _mort = value!;
    notifyListeners();
  }

  void change_nombre(String? value) {
    _nombre = value!;
    notifyListeners();
  }
}

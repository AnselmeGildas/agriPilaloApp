// ignore_for_file: non_constant_identifier_n, non_constant_identifier_names
import 'package:flutter/material.dart';

class ProviderAchatPoussin with ChangeNotifier {
  bool _affiche = false;
  String _origine = "";
  String _nombre = "";
  String _montant = "";
  bool _reduit = false;
  String _prix_unitaire = "";

  bool get affiche {
    return _affiche;
  }

  bool get reduire {
    return _reduit;
  }

  String get origine {
    return _origine;
  }

  String get nombre {
    return _nombre;
  }

  String get prix_unitaire {
    return _prix_unitaire;
  }

  String get montant {
    return _montant;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_reduire(bool? value) {
    _reduit = value!;
    notifyListeners();
  }

  void change_origine(String? value, TextEditingController origine) {
    _origine = value!;
    origine.value = TextEditingValue(
        text: value.toUpperCase(), selection: origine.selection);
    notifyListeners();
  }

  void change_nombre(String? value) {
    _nombre = value!;
    notifyListeners();
  }

  void change_prix_unitaire(String? value) {
    _prix_unitaire = value!;
    notifyListeners();
  }

  void change_montant(String? value) {
    _montant = value!;
    notifyListeners();
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderGestionDepartement with ChangeNotifier {
  String _pays = "BENIN";

  String _departement = "DONGA";
  String _commune = "OUAKE";
  String _arrondissement = "SEMERE 2";
  String _village = "N'DJAKADA";
  bool _affiche = false;
  bool _affiche2 = false;
  bool _venir_chercher = true;

  bool get venir_chercher {
    return _venir_chercher;
  }

  void change_venir_chercher(bool value) {
    _venir_chercher = value;
    notifyListeners();
  }

  String get pays {
    return _pays;
  }

  void change_pays(String value) {
    _pays = value;
    notifyListeners();
  }

  bool get affiche2 {
    return _affiche2;
  }

  void affiche2_true() {
    _affiche2 = true;
    notifyListeners();
  }

  void affiche2_false() {
    _affiche2 = false;
    notifyListeners();
  }

  bool get affiche {
    return _affiche;
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  String get village {
    return _village;
  }

  String get departement {
    return _departement;
  }

  String get commune {
    return _commune;
  }

  String get arrondissement {
    return _arrondissement;
  }

  void change_departement(String newValue) {
    _departement = newValue;
    notifyListeners();
  }

  void change_commune(String newValue) {
    _commune = newValue;
    notifyListeners();
  }

  void change_arrondissement(String newValue) {
    _arrondissement = newValue;
    notifyListeners();
  }

  void change_village(String newValue) {
    _village = newValue;
    notifyListeners();
  }
}

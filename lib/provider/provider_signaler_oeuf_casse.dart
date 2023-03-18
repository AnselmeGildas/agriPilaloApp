// ignore_for_file: non_constant_identifier_n, non_constant_identifier_names
import 'package:flutter/material.dart';

class ProviderSignalerOeufCasse with ChangeNotifier {
  bool _affiche = false;
  String _nombre = "";
  String _description = "";
  bool _par_plateau = true;

  bool get par_plateau {
    return _par_plateau;
  }

  String get description {
    return _description;
  }

  void change_par_plateau(bool? value) {
    _par_plateau = value!;
    notifyListeners();
  }

  void change_description(String? value) {
    _description = value!;
    notifyListeners();
  }

  bool get affiche {
    return _affiche;
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

  void change_nombre(String? value) {
    _nombre = value!;
    notifyListeners();
  }
}

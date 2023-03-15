// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderNouvelleBete with ChangeNotifier {
  String _nom = "";
  String _nombre_initial = "";
  bool _affiche = false;
  String _prix = "";

  bool get affiche {
    return _affiche;
  }

  String get prix {
    return _prix;
  }

  String get nom {
    return _nom;
  }

  String get nombre_initial {
    return _nombre_initial;
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void change_prix(String? value) {
    _prix = value!;
    notifyListeners();
  }

  void change_nom(String? value) {
    _nom = value!;
    notifyListeners();
  }

  void change_nombre(String? value) {
    _nombre_initial = value!;
    notifyListeners();
  }
}

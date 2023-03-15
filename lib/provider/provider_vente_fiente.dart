// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderVenteFiente with ChangeNotifier {
  String _nombre = "";
  String _montant_total = "";
  bool _affiche = false;
  bool _reduire = false;

  bool get reduire {
    return _reduire;
  }

  void change_reduire(bool? value) {
    _reduire = value!;
    notifyListeners();
  }

  bool get affiche {
    return _affiche;
  }

  String get nombre {
    return _nombre;
  }

  String get montant_total {
    return _montant_total;
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
    _nombre = value!.isEmpty ? "0" : value;
    notifyListeners();
  }

  void change_montant_total(String? value) {
    _montant_total = value!;
    notifyListeners();
  }
}

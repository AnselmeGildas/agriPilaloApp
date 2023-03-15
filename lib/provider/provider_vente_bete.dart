// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderVenteBete with ChangeNotifier {
  String _nombre = "";
  String _montant_total = "";
  bool _affiche = false;
  String _montant_reduit = "";
  bool _reduire = false;

  String get montant_reduit {
    return _montant_reduit;
  }

  bool get reduire {
    return _reduire;
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

  void change_reduire(bool? value) {
    _reduire = value!;
    notifyListeners();
  }

  void change_montant_reduit(String? value) {
    _montant_reduit = value!;
    notifyListeners();
  }

  void change_nombre(String? value) {
    _nombre = value!;
    notifyListeners();
  }

  void change_montant_total(String? value) {
    _montant_total = value!;
    notifyListeners();
  }
}

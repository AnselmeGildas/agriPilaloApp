// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderDepense with ChangeNotifier {
  bool _affiche = false;
  String _description = "";
  String _montant = "";

  bool get affiche {
    return _affiche;
  }

  String get description {
    return _description;
  }

  String get montant {
    return _montant;
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void change_description(String? value) {
    _description = value!;
    notifyListeners();
  }

  void change_montant(String? value) {
    _montant = value!;
    notifyListeners();
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderEnregistrerProbleme with ChangeNotifier {
  bool _affiche = false;
  String _description = "";

  bool get affiche {
    return _affiche;
  }

  String get description {
    return _description;
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

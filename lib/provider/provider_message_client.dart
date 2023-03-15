// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderMessageClient with ChangeNotifier {
  String _message = "";
  bool _affiche = false;

  String get message {
    return _message;
  }

  bool get affiche {
    return _affiche;
  }

  void change_message(String? value) {
    _message = value!;
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

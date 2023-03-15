// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderResetPassword with ChangeNotifier {
  bool _affiche = false;
  String _email = "";

  bool get affiche {
    return _affiche;
  }

  String get email {
    return _email;
  }

  void change_email(String? value) {
    _email = value!;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }
}

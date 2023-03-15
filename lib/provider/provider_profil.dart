// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderProfil with ChangeNotifier {
  bool _affiche = false;
  String _photo_url = "";

  String get photo_url {
    return _photo_url;
  }

  bool get affiche {
    return _affiche;
  }

  void change_photo_url(String? value) {
    _photo_url = value!;
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

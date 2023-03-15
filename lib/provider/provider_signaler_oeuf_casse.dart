// ignore_for_file: non_constant_identifier_n, non_constant_identifier_names
import 'package:flutter/material.dart';

class ProviderSignalerOeufCasse with ChangeNotifier {
  bool _affiche = false;
  String _nombre = "";
  String _description = "";

  String get description {
    return _description;
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

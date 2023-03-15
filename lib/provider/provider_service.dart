// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderService extends ChangeNotifier {
  String _nom = "";
  String _titre = "";
  String _description = "";
  String _photo_url = "";
  bool _affiche = false;
  bool _file_affiche = false;

  bool get file_affiche {
    return _file_affiche;
  }

  String get nom {
    return _nom;
  }

  String get titre {
    return _titre;
  }

  String get description {
    return _description;
  }

  String get photo_url {
    return _photo_url;
  }

  bool get affiche {
    return _affiche;
  }

  void file_affiche_false() {
    _file_affiche = false;
    notifyListeners();
  }

  void file_affiche_true() {
    _file_affiche = true;
    notifyListeners();
  }

  void change_nom(String? vakue) {
    _nom = vakue!;
    notifyListeners();
  }

  void change_titre(String? value) {
    _titre = value!;
    notifyListeners();
  }

  void change_description(String? value) {
    _description = value!;
    notifyListeners();
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

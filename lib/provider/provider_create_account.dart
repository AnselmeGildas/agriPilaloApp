// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class providerCreateAccount with ChangeNotifier {
  String _nom = "";
  String _prenom = "";
  String _sexe = "Masculin";
  String _email = "";
  String _numero = "";
  String _password = "";
  String _confirm_password = "";
  bool _password_Obscure = true;
  bool _affiche = false;
  bool _circular = false;
  int _code = 0;

  int get code {
    return _code;
  }

  void change_code(String? value) {
    _code = value!.isNotEmpty ? int.parse(value) : 0;
    notifyListeners();
  }

  bool get circular {
    return _circular;
  }

  void circular_true() {
    _circular = true;
    notifyListeners();
  }

  void circular_false() {
    _circular = false;
    notifyListeners();
  }

  bool get affiche {
    return _affiche;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  bool get password_obscure {
    return _password_Obscure;
  }

  void change_password_obscure() {
    _password_Obscure = !_password_Obscure;
    notifyListeners();
  }

  String get nom {
    return _nom;
  }

  void change_nom(String? value, TextEditingController nom_utilisateur) {
    _nom = value!.toUpperCase();
    nom_utilisateur.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_utilisateur.selection);
    notifyListeners();
  }

  String get prenom {
    return _prenom;
  }

  void change_prenom(String? value, TextEditingController prenom) {
    _prenom = value!;
    prenom.value = TextEditingValue(
        text: value.toUpperCase(), selection: prenom.selection);
    notifyListeners();
  }

  String get email {
    return _email;
  }

  void change_email(String? value) {
    _email = value!;
    notifyListeners();
  }

  String get numero {
    return _numero;
  }

  void change_numero(String? value) {
    _numero = value!;
    notifyListeners();
  }

  String get sexe {
    return _sexe;
  }

  void change_sexe(String? value) {
    _sexe = value!;
    notifyListeners();
  }

  String get password {
    return _password;
  }

  void change_password(String? value) {
    _password = value!;
    notifyListeners();
  }

  String get confirm_password {
    return _confirm_password;
  }

  void change_confirm_password(String? value) {
    _confirm_password = value!;
    notifyListeners();
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderConnexion with ChangeNotifier {
  bool _connexion = false;
  bool _is_obscure = false;
  String _email = "";
  String _password = "";

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  bool get connexion {
    return _connexion;
  }

  bool get is_obscure {
    return _is_obscure;
  }

  void change_email(String? value) {
    _email = value!;
    notifyListeners();
  }

  void change_password(String? value) {
    _password = value!;
    notifyListeners();
  }

  void connexion_true() {
    _connexion = true;
    notifyListeners();
  }

  void connexion_false() {
    _connexion = false;
    notifyListeners();
  }

  void obscure_true() {
    _is_obscure = !_is_obscure;
    notifyListeners();
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';

class ProviderNewPassword with ChangeNotifier {
  bool _affiche = false;
  String _ancien_password = "";
  String _nouveau_password = "";
  String _confirm_password = "";
  bool _is_obscure_ancien_password = true;
  bool _is_obscure_nouveau_password = true;

  bool get affiche {
    return _affiche;
  }

  bool get is_obscure_ancien_password {
    return _is_obscure_ancien_password;
  }

  bool get is_obscure_nouveau_password {
    return _is_obscure_nouveau_password;
  }

  String get ancien_password {
    return _ancien_password;
  }

  String get nouveau_password {
    return _nouveau_password;
  }

  String get confirm_password {
    return _confirm_password;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_is_obscure_ancien_password() {
    _is_obscure_ancien_password = !_is_obscure_ancien_password;
    noDefaultAppDelete();
  }

  void change_is_obscure_nouveau_password() {
    _is_obscure_nouveau_password = !_is_obscure_nouveau_password;
    notifyListeners();
  }

  void change_ancien_password(String? value) {
    _ancien_password = value!;
    notifyListeners();
  }

  void change_nouveau_password(String? value) {
    _nouveau_password = value!;
    notifyListeners();
  }

  void change_confirm_password(String? value) {
    _confirm_password = value!;
    notifyListeners();
  }
}

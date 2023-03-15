// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderTraiterCommande with ChangeNotifier {
  bool _affiche = true;
  bool _traite = false;
  bool _circule = false;
  bool _statut = false;
  bool get statut {
    return _statut;
  }

  bool get circul {
    return _circule;
  }

  bool get affiche {
    return _affiche;
  }

  bool get traite {
    return _traite;
  }

  void change_statut(bool? value) {
    _statut = value!;
    notifyListeners();
  }

  void circul_false() {
    _circule = false;
    notifyListeners();
  }

  void circul_true() {
    _circule = true;
    notifyListeners();
  }

  void traiter_commande() {
    _affiche = false;
    _traite = true;
    notifyListeners();
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';

class ProviderDrawerAdmin with ChangeNotifier {
  bool _home = true;
  bool _commande_journalieres = false;
  bool _toutes_commandes = false;
  bool _appreciation = false;
  bool _vagues = false;
  bool _list_vagues = false;
  bool _vagues_clotures = false;

  bool get vagues_clotures {
    return _vagues_clotures;
  }

  bool get list_vagues {
    return _list_vagues;
  }

  bool get vagues {
    return _vagues;
  }

  bool get appreciation {
    return _appreciation;
  }

  bool get home {
    return _home;
  }

  bool get commandes_journalieres {
    return _commande_journalieres;
  }

  bool get commandes {
    return _toutes_commandes;
  }

  void change_home() {
    _home = true;
    _commande_journalieres = false;
    _toutes_commandes = false;
    _appreciation = false;
    _list_vagues = false;
    _vagues = false;
    _vagues_clotures = false;
    notifyListeners();
  }

  void change_commande_journaliere() {
    _home = false;
    _commande_journalieres = true;
    _toutes_commandes = false;
    _appreciation = false;
    _list_vagues = false;
    _vagues = false;
    _vagues_clotures = false;
    notifyListeners();
  }

  void change_commandes() {
    _home = false;
    _commande_journalieres = false;
    _toutes_commandes = true;
    _appreciation = false;
    _list_vagues = false;
    _vagues = false;
    _vagues_clotures = false;
    notifyListeners();
  }

  void change_appreciation() {
    _home = false;
    _commande_journalieres = false;
    _toutes_commandes = false;
    _appreciation = true;
    _list_vagues = false;
    _vagues = false;
    _vagues_clotures = false;
    notifyListeners();
  }

  void change_list_vagues() {
    _home = false;
    _commande_journalieres = false;
    _toutes_commandes = false;
    _appreciation = false;
    _list_vagues = true;
    _vagues = false;
    _vagues_clotures = false;
    notifyListeners();
  }

  void change_vagues() {
    _home = false;
    _commande_journalieres = false;
    _toutes_commandes = false;
    _appreciation = false;
    _list_vagues = false;
    _vagues = true;
    _vagues_clotures = false;
    notifyListeners();
  }

  void change_vagues_clotures() {
    _home = false;
    _commande_journalieres = false;
    _toutes_commandes = false;
    _appreciation = false;
    _list_vagues = false;
    _vagues = false;
    _vagues_clotures = true;
    notifyListeners();
  }
}

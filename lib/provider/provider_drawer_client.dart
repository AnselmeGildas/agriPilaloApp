// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderDrawerClient with ChangeNotifier {
  bool _home = true;
  bool _commande = false;
  bool _list_commandes = false;
  bool _apprecier = false;
  bool _a_propos = false;
  bool _aide = false;

  bool get home {
    return _home;
  }

  bool get commande {
    return _commande;
  }

  bool get list_commande {
    return _list_commandes;
  }

  bool get apprecier {
    return _apprecier;
  }

  bool get apropos {
    return _a_propos;
  }

  bool get besoin_aide {
    return _aide;
  }

  void accueil() {
    _home = true;
    _commande = false;
    _list_commandes = false;
    _apprecier = false;
    _a_propos = false;
    _aide = false;
    notifyListeners();
  }

  void passer_commande() {
    _home = false;
    _commande = true;
    _list_commandes = false;
    _apprecier = false;
    _a_propos = false;
    _aide = false;
    notifyListeners();
  }

  void list_des_commandes() {
    _home = false;
    _commande = false;
    _list_commandes = true;
    _apprecier = false;
    _a_propos = false;
    _aide = false;
    notifyListeners();
  }

  void apprecier_commande() {
    _home = false;
    _commande = false;
    _list_commandes = false;
    _apprecier = true;
    _a_propos = false;
    _aide = false;
    notifyListeners();
  }

  void aproposdenous() {
    _home = false;
    _commande = false;
    _list_commandes = false;
    _apprecier = false;
    _a_propos = true;
    _aide = false;
    notifyListeners();
  }

  void besoindaide() {
    _home = false;
    _commande = false;
    _list_commandes = false;
    _apprecier = false;
    _a_propos = false;
    _aide = true;
    notifyListeners();
  }
}

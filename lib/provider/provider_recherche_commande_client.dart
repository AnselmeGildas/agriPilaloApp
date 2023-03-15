// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderRechercheCommandeClient with ChangeNotifier {
  String _email = "";
  bool _affiche = false;
  bool _venir_chercher_commande = true;
  bool _supporter_frais_transports = true;
  String _achat = "";
  String _description = "";
  String _exigences = "";
  String _indication = "";
  String _coordonnees = "";
  bool _circular = false;

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

  String get achat {
    return _achat;
  }

  void changer_achat(String? value) {
    _achat = value!;
    notifyListeners();
  }

  String get description {
    return _description;
  }

  void changer_description(String? value) {
    _description = value!;
    notifyListeners();
  }

  String get exigences {
    return _exigences;
  }

  void changer_exigences(String? value) {
    _exigences = value!;
    notifyListeners();
  }

  String get indication {
    return _indication;
  }

  void changer_indication(String? value) {
    _indication = value!;
    notifyListeners();
  }

  String get coordonnees {
    return _coordonnees;
  }

  void changer_coordonnees(String? value) {
    _coordonnees = value!;
    notifyListeners();
  }

  bool get venir_chercher_commande {
    return _venir_chercher_commande;
  }

  void change_venir_chercher_commande(bool value) {
    _venir_chercher_commande = value;
    notifyListeners();
  }

  bool get supporter_frais_transport {
    return _supporter_frais_transports;
  }

  void change_supporter_frais_transports(bool value) {
    _supporter_frais_transports = value;
    notifyListeners();
  }

  String get email {
    return _email;
  }

  bool get affiche {
    return _affiche;
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void change_email(String? value) {
    _email = value!;
    notifyListeners();
  }
}

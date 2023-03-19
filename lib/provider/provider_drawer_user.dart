// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderDrawerUser with ChangeNotifier {
  bool _home = true;
  bool _vente_oeuf = false;
  bool _vente_bete = false;
  bool _vente_fiente = false;
  bool _signaler_poussin = false;
  bool _signaler_bete = false;
  bool _signaler_oeuf = false;
  bool _signaler_bete_retablie = false;
  bool _signaler_poussin_retablie = false;
  bool _recharger_bete = false;
  bool _recharger_oeuf = false;
  bool _recharger_fiente = false;
  bool _statistique_journalier = false;
  bool _enregistrer_vente = false;
  bool _ventes_a_credits = false;
  bool _enregistrer_depense = false;
  bool _enregistrer_perte = false;

  bool get statistique_journalier {
    return _statistique_journalier;
  }

  bool get enregistrer_vente {
    return _enregistrer_vente;
  }

  bool get ventes_a_credits {
    return _ventes_a_credits;
  }

  bool get enregistrer_depense {
    return _enregistrer_depense;
  }

  bool get enregistrer_perte {
    return _enregistrer_perte;
  }

  bool get recharger_oeuf {
    return _recharger_oeuf;
  }

  bool get recharger_bete {
    return _recharger_bete;
  }

  bool get recharger_fiente {
    return _recharger_fiente;
  }

  bool get home {
    return _home;
  }

  bool get vente_oeuf {
    return _vente_oeuf;
  }

  bool get vente_bete {
    return _vente_bete;
  }

  bool get vente_fiente {
    return _vente_fiente;
  }

  bool get signaler_poussin {
    return _signaler_poussin;
  }

  bool get signaler_oeuf {
    return _signaler_oeuf;
  }

  bool get signaler_bete {
    return _signaler_bete;
  }

  bool get signaler_poussin_retablie {
    return _signaler_poussin_retablie;
  }

  bool get signaler_bete_retablie {
    return _signaler_bete_retablie;
  }

  void change_home() {
    _home = true;
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    notifyListeners();
  }

  void change_vente_bete() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    _home = false;
    _vente_bete = true;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    notifyListeners();
  }

  void change_vente_oeuf() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = true;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    notifyListeners();
  }

  void change_vente_fiente() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = true;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_signaler_bete() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = true;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_signaler_oeuf() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = true;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_signaler_poussin() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = true;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_signaler_bete_retablie() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = true;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_signaler_poussin_retablie() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = true;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_recharger_eouf() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = true;
    notifyListeners();
  }

  void change_recharger_bete() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = true;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_recharger_fiente() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = true;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_statistique_journalier() {
    _statistique_journalier = true;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_enregistrer_vente_a_credit() {
    _statistique_journalier = false;
    _enregistrer_vente = true;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_ventes_a_credits() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = true;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_enregistrer_depense() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = true;
    _enregistrer_perte = false;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }

  void change_enregistrer_perte() {
    _statistique_journalier = false;
    _enregistrer_vente = false;
    _ventes_a_credits = false;
    _enregistrer_depense = false;
    _enregistrer_perte = true;
    _home = false;
    _vente_bete = false;
    _vente_fiente = false;
    _vente_oeuf = false;
    _signaler_bete = false;
    _signaler_oeuf = false;
    _signaler_poussin = false;
    _signaler_bete_retablie = false;
    _signaler_poussin_retablie = false;
    _recharger_bete = false;
    _recharger_fiente = false;
    _recharger_oeuf = false;
    notifyListeners();
  }
}

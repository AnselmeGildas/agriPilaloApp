// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';

class ProviderVagueAdmin with ChangeNotifier {
  bool _home = true;
  bool _statistique_journalier = false;
  bool _vagues = false;
  bool _rubrique = false;
  bool _historique = false;
  bool _vente_betes = false;
  bool _vente_fiente = false;
  bool _ventes_oeufs_table = false;
  bool _enregister_depense = false;
  bool _enregister_perte = false;
  bool _nouvelle_bete = false;
  bool _stock_oeufs = false;
  bool _stock_betes = false;
  bool _stock_fiante = false;
  bool _achat_poussin = false;
  bool _poussin_malade = false;
  bool _bete_malade = false;
  bool _liste_betes = false;
  bool _liste_depenses = false;
  bool _liste_pertes = false;
  bool _signaler_oeuf_casse = false;

  bool get vagues {
    return _vagues;
  }

  bool get home {
    return _home;
  }

  bool get statistique_journalier {
    return _statistique_journalier;
  }

  bool get rubrique {
    return _rubrique;
  }

  bool get historique {
    return _historique;
  }

  bool get ventes_betes {
    return _vente_betes;
  }

  bool get ventes_fiantes {
    return _vente_fiente;
  }

  bool get venets_oeufs_table {
    return _ventes_oeufs_table;
  }

  bool get enregister_depense {
    return _enregister_depense;
  }

  bool get enregister_perte {
    return _enregister_perte;
  }

  bool get nouvelle_betes {
    return _nouvelle_bete;
  }

  bool get stock_betes {
    return _stock_betes;
  }

  bool get stock_oeufs_table {
    return _stock_oeufs;
  }

  bool get stock_fientes {
    return _stock_fiante;
  }

  bool get achat_poussion {
    return _achat_poussin;
  }

  bool get poussin_malade {
    return _poussin_malade;
  }

  bool get bete_malade {
    return _bete_malade;
  }

  bool get listes_betes {
    return _liste_betes;
  }

  bool get liste_depense {
    return _liste_depenses;
  }

  bool get liste_perte {
    return _liste_pertes;
  }

  bool get oeufs_casse {
    return _signaler_oeuf_casse;
  }

  void vague_true() {
    _home = false;
    _vagues = true;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void home_true() {
    _home = true;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void statistique_journalier_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = true;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void rubrique_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = true;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void historique_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = true;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void ventes_betes_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = true;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void ventes_fiantes_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = true;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void ventes_oeufs_table_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = true;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void enregister_depense_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = true;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void enregister_perte_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = true;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void nouvelle_bete_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = true;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void stock_betes_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = true;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void stock_oeufs_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = true;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void stock_fientes_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = true;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void achat_poussin_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = true;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void poussin_malade_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = true;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void bete_malade_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = true;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void liste_betes_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = true;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void liste_depense_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = true;
    _liste_pertes = false;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void liste_perte_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = true;
    _signaler_oeuf_casse = false;
    notifyListeners();
  }

  void signaler_oeuf_casse_true() {
    _home = false;
    _vagues = false;
    _statistique_journalier = false;
    _rubrique = false;
    _historique = false;
    _vente_betes = false;
    _vente_fiente = false;
    _ventes_oeufs_table = false;
    _enregister_depense = false;
    _enregister_perte = false;
    _nouvelle_bete = false;
    _stock_oeufs = false;
    _stock_betes = false;
    _stock_fiante = false;
    _achat_poussin = false;
    _poussin_malade = false;
    _bete_malade = false;
    _liste_betes = false;
    _liste_depenses = false;
    _liste_pertes = false;
    _signaler_oeuf_casse = true;
    notifyListeners();
  }
}

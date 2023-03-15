// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProviderGestionCommande with ChangeNotifier {
  String _nom = "";
  String _email = "";
  String _numero = "";
  String _achat = "";
  String _description = "";
  String _date_livraison = "";
  String _exigences = "";
  bool _nom_bool = false;
  bool _email_bool = false;
  bool _numero_bool = false;
  bool _achat_bool = false;
  bool _description_bool = false;
  bool _exigences_bool = false;
  bool _supporter_frais_transport = true;
  String _coordonnees_gps = "";
  String _indication = "";
  bool _affiche = false;

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

  String get indication {
    return _indication;
  }

  void change_indication(String value) {
    _indication = value;
    notifyListeners();
  }

  String get coordonnees_gps {
    return _coordonnees_gps;
  }

  void changer_coordonnees_gps(String value) {
    _coordonnees_gps = value;
    notifyListeners();
  }

  bool get supporter_frais_transports {
    return _supporter_frais_transport;
  }

  void changer_supporter_frais_transport(bool value) {
    _supporter_frais_transport = value;
    notifyListeners();
  }

  void initialisation() {
    _nom_bool = false;
    _email_bool = false;
    _numero_bool = false;
    _achat_bool = false;
    _description_bool = false;
    _exigences_bool = false;
    notifyListeners();
  }

  bool get exigences_bool {
    return _exigences_bool;
  }

  void exigences_bool_true() {
    _exigences_bool = true;
    notifyListeners();
  }

  void exigences_bool_false() {
    _exigences_bool = false;
    notifyListeners();
  }

  bool get description_bool {
    return _description_bool;
  }

  void description_bool_true() {
    _description_bool = true;
    notifyListeners();
  }

  void description_bool_false() {
    _description_bool = false;
    notifyListeners();
  }

  bool get achat_bool {
    return _achat_bool;
  }

  void achat_bool_true() {
    _achat_bool = true;
    notifyListeners();
  }

  void achat_bool_false() {
    _achat_bool = false;
    notifyListeners();
  }

  bool get numero_bool {
    return _numero_bool;
  }

  void numero_bool_true() {
    _numero_bool = true;
    notifyListeners();
  }

  void numero_bool_false() {
    _numero_bool = false;
    notifyListeners();
  }

  bool get email_bool {
    return _email_bool;
  }

  void email_bool_true() {
    _email_bool = true;
    notifyListeners();
  }

  void email_bool_false() {
    _email_bool = false;
    notifyListeners();
  }

  bool get nom_bool {
    return _nom_bool;
  }

  void nom_bool_true() {
    _nom_bool = true;
    notifyListeners();
  }

  void nom_bool_false() {
    _nom_bool = false;
    notifyListeners();
  }

  String get nom {
    return _nom;
  }

  String get email {
    return _email;
  }

  String get numero {
    return _numero;
  }

  String get achat {
    return _achat;
  }

  String get description {
    return _description;
  }

  String get date_livraison {
    return _date_livraison;
  }

  String get exigences {
    return _exigences;
  }

  void change_nom(String? value, TextEditingController nom_controller) {
    value!.isNotEmpty ? _nom = value : "";
    nom_controller.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_controller.selection);
    notifyListeners();
  }

  void change_email(String? value) {
    value!.isNotEmpty ? _email = value : "";
    notifyListeners();
  }

  void change_numero(String? value) {
    value!.isNotEmpty ? _numero = value : "";
    notifyListeners();
  }

  void change_achat(String? value) {
    value!.isNotEmpty ? _achat = value : "";
    notifyListeners();
  }

  void change_description(String? value) {
    value!.isNotEmpty ? _description = value : "";
    notifyListeners();
  }

  void change_date_livraison(
      DateTime? date, TextEditingController date_livraison) {
    String? format = DateFormat("dd-MM-yyyy").format(date!);
    date_livraison.text = format.isNotEmpty ? format : "";
    notifyListeners();
  }

  void change_exigences(String? value) {
    value!.isNotEmpty ? _exigences = value : "";
    notifyListeners();
  }
}

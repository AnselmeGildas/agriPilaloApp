// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderRechargerOeufTables with ChangeNotifier {
  bool _affiche = false;
  String _nombre = "";
  bool _recharger_par_plateau = true;

  bool get recharger_par_plateau {
    return _recharger_par_plateau;
  }

  bool get affiche {
    return _affiche;
  }

  String get nombre {
    return _nombre;
  }

  void change_recharger_par_plateau(bool? value) {
    _recharger_par_plateau = value!;
    notifyListeners();
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_nombre(String? value) {
    _nombre = value!;
    notifyListeners();
  }
}

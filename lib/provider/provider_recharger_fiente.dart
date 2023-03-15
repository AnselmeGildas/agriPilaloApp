// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderRechargerFiente with ChangeNotifier {
  bool _affiche = false;
  String _nombre = "";
  bool get affiche {
    return _affiche;
  }

  String get nombre {
    return _nombre;
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

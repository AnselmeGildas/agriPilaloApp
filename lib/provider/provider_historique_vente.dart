// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderHistoriqueVente with ChangeNotifier {
  bool _affiche = false;
  String _anne = "";

  bool get affiche {
    return _affiche;
  }

  String get annee {
    return _anne;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_annee(String? value) {
    _anne = value!;
    notifyListeners();
  }
}

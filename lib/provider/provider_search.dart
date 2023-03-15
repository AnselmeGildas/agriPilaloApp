// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class Search with ChangeNotifier {
  bool _afficher = false;
  String _value = "";

  String get value {
    return _value;
  }

  void change_value(String? value) {
    !_afficher ? _value = "" : _value = value!.toLowerCase();
    notifyListeners();
  }

  bool get afficher {
    return _afficher;
  }

  void afficher_void() {
    _afficher = !afficher;
    notifyListeners();
  }
}

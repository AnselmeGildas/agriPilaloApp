// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderFormatTimestamp with ChangeNotifier {
  int _premiere_date_in_millisecond = 0;
  int _deuxieme_date_in_millisecond = 0;

  int get premiere_date_in_miili {
    return _premiere_date_in_millisecond;
  }

  int get deuximed_date_in_milli {
    return _deuxieme_date_in_millisecond;
  }

  void change_premiere(DateTime? premiere) {
    _premiere_date_in_millisecond =
        premiere != null ? premiere.millisecondsSinceEpoch : 0;
    notifyListeners();
  }

  void change_deuxieme(DateTime? deuxieme) {
    _deuxieme_date_in_millisecond =
        deuxieme != null ? deuxieme.millisecondsSinceEpoch : 0;
    notifyListeners();
  }
}

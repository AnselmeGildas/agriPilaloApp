// ignore_for_file: unnecessary_new, constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:math';

class RandomDigits {
  static const MaxNumericDigits = 17;
  static final _random = Random();

  static int getInteger(int digitCount) {
    if (digitCount > MaxNumericDigits || digitCount < 1)
      throw new RangeError.range(0, 1, MaxNumericDigits, "Digit Count");
    var digit = _random.nextInt(9) + 1; // first digit must not be a zero
    int n = digit;

    for (var i = 0; i < digitCount - 1; i++) {
      digit = _random.nextInt(10);
      n *= 10;
      n += digit;
    }
    return n;
  }

  static String getString(int digitCount) {
    String s = "";
    for (var i = 0; i < digitCount; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }
}

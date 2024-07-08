import 'package:flutter/material.dart';
import 'package:sneaker_shop/themes.dart';

class ThemeProvider with ChangeNotifier {
  int _themeValue = 0;
  int get themeValue => _themeValue;

  Brightness systemBrightness = Brightness.light;

  ThemeData get themeData {
    if (_themeValue == 0) {
      return systemBrightness == Brightness.light ? lightTheme : darkTheme;
    } else if (_themeValue == 1) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }

  set themeValue(int value) {
    _themeValue = value;
    notifyListeners();
  }
}

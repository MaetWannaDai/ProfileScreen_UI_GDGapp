import 'package:profile_screen_app/themes/theme.dart';
import 'package:flutter/material.dart';


class Themeprovider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  bool get isLightMode => _themeData == lightMode;

  void toggleTheme(){
    if (_themeData == lightMode){
      _themeData = darkMode;
    }
    else if (_themeData == darkMode){
      _themeData = lightMode;
    }
    notifyListeners();
  }
}
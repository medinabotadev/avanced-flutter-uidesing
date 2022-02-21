import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme    = false;
  bool _customTheme  = false;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;
    notifyListeners();
  }

  set customTheme(bool value){
    _darkTheme = false;
    _customTheme = value;
    notifyListeners();
  }
}
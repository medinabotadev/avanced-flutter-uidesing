import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme    = ThemeMode.system == ThemeMode.light ? false : true;
  bool _customTheme  = false;

  ThemeData _currentTheme = ThemeMode.system == ThemeMode.light ? ThemeData.light() : ThemeData.dark();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme){
    switch (theme) {
      case 1: // Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }


  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value){
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
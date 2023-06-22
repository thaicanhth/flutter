
import 'package:flutter/material.dart';
import 'package:project_flutter2/helpers/them_shared_prefrences.dart';

class ThemeModal extends ChangeNotifier{
  late bool _isDark;
  late ThemeSharedPrefrences themeSharedPrefrences;
  bool get isDark => _isDark;

  ThemeModal(){
    _isDark = true;
    themeSharedPrefrences = ThemeSharedPrefrences();
    getThemePrefrences();
  }
  set isDark(bool value){
    _isDark = value;
    themeSharedPrefrences.setTheme(value);
    notifyListeners();
  }

  getThemePrefrences() async{
    _isDark = await themeSharedPrefrences.getTheme();
    notifyListeners();
  }
}
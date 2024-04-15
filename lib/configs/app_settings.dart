import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSetings extends ChangeNotifier{
  late SharedPreferences _prefs;
  Map<String, int> locale = {
    'Mask': 1,
    'Score': 1,
    'Deep': 1
  };

  AppSetings(){
    _startSettings();
  }

  _startSettings() async{
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async{
    _prefs = await SharedPreferences.getInstance();
  }

  _readLocale(){
    final mask = _prefs.getInt('Mask') ?? 1;
    final score = _prefs.getInt('Score') ?? 1;
    final deep = _prefs.getInt('Deep') ?? 1;
    locale = {
      'Mask': mask,
      'Score': score,
      'Deep': deep,
    };
    notifyListeners();
  }

  setMask(int mask) async{
    await _prefs.setInt('Mask', mask);
    await _readLocale();
  }

  setScore(int score) async{
    await _prefs.setInt('Score', score);
    await _readLocale();
  }

  setDeep(int deep) async{
    await _prefs.setInt('Deep', deep);
    await _readLocale();
  }
}
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';


import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  final SharedPreferences prefs;



  //!========================
    String _chooseCode = "null";
  String get code => _chooseCode;
  void changeCountryCode(code) {
    _chooseCode = code;
    notifyListeners();
  }


  String _chooseCountry = "null";
  String get country => _chooseCountry;
  void changeCountry(country) {
    _chooseCountry = country;
    notifyListeners();
  }

  
//!========================

  LocalizationProvider({required this.prefs}) {
    _loadCurrentLanguage();
  }

  late Locale _locale = Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode!);
  late bool _isLtr = true;
  late int _languageIndex;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int get languageIndex => _languageIndex;

  void setLanguage(Locale locale) {
    _locale = locale;
    _isLtr = _locale.languageCode != 'ar';
    //dioClient.updateHeader(null, locale.countryCode);
    for(int index=0; index<AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(prefs.getString(AppConstants.countryCode) ?? AppConstants.languages[0].languageCode!,
        prefs.getString(AppConstants.countryCode) ?? AppConstants.languages[0].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    for(int index=0; index<AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    prefs.setString(AppConstants.languageCode, locale.languageCode);
    prefs.setString(AppConstants.languageCode, locale.countryCode!);
  }
}
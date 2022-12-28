// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalDataProvider with ChangeNotifier {
  //*  */
  static String? _safeToken;
  static String?  token;
  //static String get token => _safeToken ?? AppConstants.token;
  //*  */

  /*  static Future storeTokeninSafe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _safeToken = prefs.getString(AppConstants.token);
    print(_safeToken);
  
  } */

  static Map<String, String> httpHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Connection': 'keep-alive',
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };

  //'Content-Type': 'application/json; charset=UTF-8; multipart/form-data',
  static Map<String, String> httpMultipartHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Connection': 'keep-alive',
    'Content-Type': 'application/json; charset=UTF-8; multipart/form-data',
    'Authorization': 'Bearer $token'
  };
}

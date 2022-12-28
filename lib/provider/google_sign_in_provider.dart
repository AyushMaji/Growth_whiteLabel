import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  GoogleSignInAuthentication? auth;

  Future<void> login() async {
    googleAccount = await _googleSignIn.signIn();
    
    auth = await googleAccount?.authentication;
    // googleAccount.
    notifyListeners();
  }

  logout() async {
    googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}

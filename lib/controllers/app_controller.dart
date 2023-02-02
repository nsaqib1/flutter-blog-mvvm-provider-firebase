import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_blog/services/auth_service.dart';
import 'package:go_blog/services/auth_service_firebase.dart';

class AppController extends ChangeNotifier {
  static final AuthService _auth = AuthServiceFirebase();
  AuthService get auth => _auth;

  bool isLoggedIn = _auth.loginStatus();
  changeLogginStatus(bool status) {
    isLoggedIn = status;
    notifyListeners();
  }
}

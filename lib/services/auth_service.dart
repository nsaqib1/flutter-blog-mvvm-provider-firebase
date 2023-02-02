import 'dart:io';
import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/models/login_model.dart';
import 'package:go_blog/models/signup_model.dart';

abstract class AuthService {
  bool loginStatus();
  Future<AsyncMessage> signUp(SignupModel user, File image);
  Future<AsyncMessage> login(LoginModel user);
  logout();
}

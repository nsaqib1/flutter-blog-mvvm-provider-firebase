import 'package:flutter/material.dart';
import 'package:go_blog/controllers/app_controller.dart';
import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/models/login_model.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get emailController => _emailController;
  get passwordController => _passwordController;

  onLogin(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (_emailController.text.isEmpty) {
      snacbar(context, 'Email is required');
      return;
    }

    if (_passwordController.text.isEmpty) {
      snacbar(context, 'Password is required');
      return;
    }

    isLoading = true;
    notifyListeners();
    final AppController appController = context.read<AppController>();
    AsyncMessage result = await appController.auth.login(
      LoginModel(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
    isLoading = false;
    notifyListeners();

    if (result.isSuccess) {
      appController.changeLogginStatus(true);
    } else {
      // ignore: use_build_context_synchronously
      snacbar(context, result.message);
    }
  }

  snacbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepOrange,
        content: Text(message),
      ),
    );
  }
}

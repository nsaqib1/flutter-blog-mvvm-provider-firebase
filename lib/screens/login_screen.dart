import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_blog/controllers/login_controller.dart';
import 'package:go_blog/controllers/signup_controller.dart';
import 'package:go_blog/screens/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = context.watch<LoginController>();
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  hintText: 'username or email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  controller.onLogin(context);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 40),
              const Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => SignupController(),
                        child: const SignupScreen(),
                      ),
                    ),
                  );
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
        controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox(),
      ],
    );
  }
}

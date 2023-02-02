import 'package:flutter/material.dart';
import 'package:go_blog/controllers/signup_controller.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('signup screen loaded');
    final SignupController controller = context.watch<SignupController>();

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Signup'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.image == null
                          ? const AssetImage('assets/images/profile.jpg')
                          : Image.file(controller.image!).image,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: controller.onPickImage,
                        child: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.password1Controller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.password2Controller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'confirm password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.onSignup(context);
                },
                child: const Text('Signup'),
              ),
              const SizedBox(height: 40),
              const Text(
                'Already Signed Up?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
        controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_blog/controllers/home_controller.dart';
import 'package:go_blog/controllers/login_controller.dart';
import 'firebase_options.dart';

import 'package:go_blog/controllers/app_controller.dart';
import 'package:go_blog/screens/home_screen.dart';
import 'package:go_blog/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Go Blog',
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        home: Builder(
          builder: (context) {
            if (Provider.of<AppController>(context).isLoggedIn) {
              return ChangeNotifierProvider(
                create: (context) => HomeController(),
                child: const HomeScreen(),
              );
            } else {
              return ChangeNotifierProvider(
                create: (context) => LoginController(),
                child: const LoginScreen(),
              );
            }
          },
        ),
      ),
    );
  }
}

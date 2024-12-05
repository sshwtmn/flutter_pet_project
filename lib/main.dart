import 'package:flutter/material.dart';
import 'package:my_pet_project/constants/routes.dart';
import 'package:my_pet_project/views/home_page.dart';
import 'package:my_pet_project/views/login_page.dart';
import 'package:my_pet_project/views/register_page.dart';
import 'package:my_pet_project/views/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(color: Colors.blue)),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterPage(),
      welcomeRoute: (context) => const WelcomePage(),

    } ,
  ));
}





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_pet_project/views/home_page.dart';
import 'package:my_pet_project/views/login_page.dart';
import 'package:my_pet_project/views/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(color: Colors.blue)),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterPage(),
    } ,
  ));
}


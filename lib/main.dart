import 'package:flutter/material.dart';
import 'package:my_pet_project/views/content/favorites_page.dart';
import 'package:my_pet_project/views/content/location_page.dart';
import 'package:my_pet_project/views/content/profile_page.dart';
import 'package:my_pet_project/views/content/routes_page.dart';
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
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterPage(),
      '/welcome/': (context) => const WelcomePage(),
      '/location/': (context) => const LocationPage(),
      '/routes/': (context) => const RoutesPage(),
      '/favorites/': (context) => const FavoritesPage(),
      '/profile/': (context) => const ProfilePage(),
    } ,
  ));
}


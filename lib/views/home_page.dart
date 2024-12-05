import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_pet_project/firebase_options.dart';
import 'package:my_pet_project/views/welcome_page.dart';
import 'package:my_pet_project/views/login_page.dart';
import 'package:my_pet_project/views/verification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified){
                  return const WelcomePage();
                }else {
                  return const VerifyEmailWidget();
                }
              }else {
                return const LoginView();
              }
              return const Text('Done');
            default:
              return const CircularProgressIndicator();
          }
        }
        );
  }
}

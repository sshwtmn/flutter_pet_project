import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_pet_project/constants/routes.dart';

import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(hintText: 'Enter your password'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                final email = _email.text.trim();
                final password = _password.text.trim();
                try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                      final user = FirebaseAuth.instance.currentUser;
                      if (user?.emailVerified ?? false){
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
                      }
                 else {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(emailVerificationRoute, (route) => false);
                      }

                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-credential') {
                    await showErrorDialog(
                      context,
                      'Invalid credentials',
                    );

                  }
                }
                catch (e) {
                  await showErrorDialog(context, e.toString());
                }
              },
              child: const Text('Login')),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text('Not registred yet? Register here!'),
          )
        ],
      ),
    );
  }
}


import 'dart:developer' as devtools show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_pet_project/constants/routes.dart';
import 'package:my_pet_project/utilities/show_error_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: const Text('Register'),
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
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    await showErrorDialog(context, 'Weak Password');
                  } else if (e.code == 'email-already-in-use') {
                    await showErrorDialog(context, 'Email already in use');
                  } else if (e.code == 'invalid-email') {
                    await showErrorDialog(context, 'Invalid email');
                  } else {
                    await showErrorDialog(
                      context,
                      'Error ${e.code}',
                    );
                  }
                }catch (e) {
                  await showErrorDialog(context, e.toString());
                }
              },
              child: const Text('Register')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text('Already registered? Login Here!'))
        ],
      ),
    );
  }
}

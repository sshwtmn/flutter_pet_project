import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

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
                final userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                print(userCredential);
              },
              child: const Text('Register')
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login/',
                        (route) => false);
              },
              child: const Text('Already registered? Login Here!'))
        ],
      ),
    );
  }
}


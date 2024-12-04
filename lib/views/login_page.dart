import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    print('Email init');
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    print('Email dispose');
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
                  final userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  print(userCredential);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-credential') {
                    print('INVALID CREDENTIALS');
                  }
                }
              },
              child: const Text('Login')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/register/',
                  (route) => false);
            },
            child: const Text('Not registred yet? Register here!'),
          )
        ],
      ),
    );
  }
}

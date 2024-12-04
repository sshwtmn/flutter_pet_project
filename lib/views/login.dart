import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final TextEditingController _email = TextEditingController();
  // final TextEditingController _password = TextEditingController();

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
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform
        ),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.done:
              print('ConnectionState.DONE');
              return Column(
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
                          final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          print(userCredential);

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-credential'){
                            print('INVALID CREDENTIALS');
                            print(e.message);
                          }
                          }
                        }
                        ,
                      child: const Text('Login'))
                ],
              );
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}

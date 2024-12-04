import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailWidget extends StatefulWidget {
  const VerifyEmailWidget({super.key});

  @override
  State<VerifyEmailWidget> createState() => _VerifyEmailWidgetState();
}

class _VerifyEmailWidgetState extends State<VerifyEmailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email verification'),
      ),
      body: Column(
        children: [
          const Text('Please verify your email address:'),
          ElevatedButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text('Send Email verification'),
          )
        ],
      ),
    );
  }
}

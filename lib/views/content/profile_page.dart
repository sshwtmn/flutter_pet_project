import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<bool> showLogOutDialog(BuildContext context){
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text('Cancel')),
            TextButton(onPressed: () {
              Navigator.of(context).pop(true);
            }, child: const Text('Log out')),
          ],
        );
      },
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile Page'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async  {
                final shouldLogOut = await showLogOutDialog(context);
                if (shouldLogOut) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/login/', (_) => false);
                }
                devtools.log(shouldLogOut.toString());
              },
              child: const Text('Log Out'))
        ],
      ),
    );
  }
}

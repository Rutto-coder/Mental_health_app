import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Controllers/auth_Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final username = FirebaseAuth.instance.currentUser?.email.toString().trim();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
              child: Text(
            'You are signed in as:',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
          )),
          Text(
            '$username',
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.w300, color: Colors.green),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser?.providerData.clear;
                signout();
              },
              child: const Text('Sign Out'))
        ],
      ),
    );
  }
}

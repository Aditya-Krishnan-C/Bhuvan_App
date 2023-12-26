import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is login
          if (snapshot.hasData) {
            return HomeScreen();
          }
          //not login
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

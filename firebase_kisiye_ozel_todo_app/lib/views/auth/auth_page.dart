import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_kisiye_ozel_todo_app/views/auth/login_or_register_page.dart';
import 'package:firebase_kisiye_ozel_todo_app/views/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

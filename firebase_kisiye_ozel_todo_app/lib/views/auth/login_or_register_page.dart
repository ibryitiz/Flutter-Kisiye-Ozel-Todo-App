import 'package:firebase_kisiye_ozel_todo_app/view_model/auth_view_model/login_or_register_page_view_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/views/auth/login_page.dart';
import 'package:firebase_kisiye_ozel_todo_app/views/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginOrRegisterPageViewModel>(
      builder: (context, value, child) {
        if (value.isLoginPage) {
          return const LoginPage();
        } else {
          return const RegisterPage();
        }
      },
    );
  }
}

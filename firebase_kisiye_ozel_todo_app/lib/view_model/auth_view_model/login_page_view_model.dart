import 'package:firebase_kisiye_ozel_todo_app/models/user_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/repository/firebase_auth_repository.dart';
import 'package:flutter/material.dart';

class LoginPageViewModel with ChangeNotifier {
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;

  LoginPageViewModel() {
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
  final FirebaseAuthRepository _authRepository = FirebaseAuthRepository();

  void login(BuildContext context) async {
    try {
      if (_emailController.text.isNotEmpty && _pwController.text.isNotEmpty) {
        UserModel userModel = UserModel(
          email: _emailController.text,
        );
        dynamic userId = await _authRepository.signIn(_emailController.text, _pwController.text, userModel);
        userModel.id = userId;
      }
      _emailController.clear();
      _pwController.clear();
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get pwController => _pwController;
}

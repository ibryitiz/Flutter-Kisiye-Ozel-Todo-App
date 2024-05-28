import 'package:firebase_kisiye_ozel_todo_app/models/user_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/repository/firebase_auth_repository.dart';
import 'package:flutter/material.dart';

class RegisterPageViewModel with ChangeNotifier {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  RegisterPageViewModel() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  final FirebaseAuthRepository _authRepository = FirebaseAuthRepository();

  void register(BuildContext context) async {
    try {
      if (_nameController.text.isNotEmpty &&
          _surnameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty) {
        if (_passwordController.text == _confirmPasswordController.text) {
          UserModel userModel = UserModel(
            name: _nameController.text,
            surname: _surnameController.text,
            email: _emailController.text,
          );
          dynamic userId = await _authRepository.signUp(_emailController.text, _passwordController.text, userModel);
          userModel.id = userId;
        }
      }
      _nameController.clear();
      _surnameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
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

  TextEditingController get nameController => _nameController;
  TextEditingController get surnameController => _surnameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
}

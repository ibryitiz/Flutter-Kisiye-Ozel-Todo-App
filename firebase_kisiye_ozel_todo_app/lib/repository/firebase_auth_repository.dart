import 'package:firebase_kisiye_ozel_todo_app/models/user_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/service/auth_service.dart';

class FirebaseAuthRepository {
  final AuthService _authService = AuthService();

  Future signIn(String email, String password, UserModel userModel) async {
    await _authService.signIn(email, password, userModel);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future signUp(String email, String password, UserModel userModel) async {
    await _authService.signUp(email, password, userModel);
  }
}

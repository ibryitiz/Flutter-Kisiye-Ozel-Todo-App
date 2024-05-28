import 'package:firebase_kisiye_ozel_todo_app/components/my_text_field.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_colors.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_texts.dart';
import 'package:firebase_kisiye_ozel_todo_app/models/todo.dart';
import 'package:firebase_kisiye_ozel_todo_app/models/user_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/repository/firebase_auth_repository.dart';
import 'package:firebase_kisiye_ozel_todo_app/repository/firebase_firestore_repository.dart';
import 'package:flutter/material.dart';

class HomePageViewModel with ChangeNotifier {
  late final TextEditingController _todoController;

  HomePageViewModel() {
    _todoController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getList();
    });
  }
  final FirebaseAuthRepository _authRepository = FirebaseAuthRepository();
  final FirebaseFirestoreRepository _firestoreRepository = FirebaseFirestoreRepository();

  void logOut() async {
    await _authRepository.signOut();
  }

  Stream<List<Todo>> getList() {
    return _firestoreRepository.getTodos();
  }

  void addToTodo(BuildContext context) async {
    try {
      List<String>? result = await goShowDialog(context);
      if (result != null) {
        String todoName = result[0];
        Todo todo = Todo(todo: todoName, isCompleted: false);
        var todoId = await _firestoreRepository.addTodo(todo);
        todo.id = todoId;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void deleteToTodo(Todo todo) async {
    await _firestoreRepository.deleteTodo(todo);
  }

  void updateToTodo(BuildContext context, Todo todo) async {
    try {
      List<String>? result = await goShowDialog(context);
      if (result != null) {
        String newTodoName = result[0];
        await _firestoreRepository.updateTodo(newTodoName, todo);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<String>?> goShowDialog(BuildContext context) async {
    return showDialog<List<String>?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.instance.backgroundColor,
          title: Text(
            MyTexts.instance.addTodoText,
            style: TextStyle(color: MyColors.instance.listTileColor),
          ),
          content: MyTextField(
            hintText: MyTexts.instance.todoText,
            controller: _todoController,
            obscureText: false,
          ),
          actions: [
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _todoController.clear();
                  },
                  child: Text(
                    MyTexts.instance.cancelText,
                    style: TextStyle(color: MyColors.instance.listTileColor),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (_todoController.text.isNotEmpty) {
                        Navigator.pop(context, [_todoController.text]);
                      }
                      _todoController.clear();
                    },
                    child: Text(
                      MyTexts.instance.okeyText,
                      style: TextStyle(color: MyColors.instance.listTileColor),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<List<UserModel>> getUser() async {
    return await _firestoreRepository.getUser();
  }

  void changeCheckBox(Todo todo, bool newValue) async {
    todo.isCompleted = newValue;
    await _firestoreRepository.updateTodoStatus(todo.id, newValue);
  }
}

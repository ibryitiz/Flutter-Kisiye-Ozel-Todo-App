import 'package:firebase_kisiye_ozel_todo_app/models/todo.dart';
import 'package:firebase_kisiye_ozel_todo_app/models/user_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/service/firestore_service.dart';

class FirebaseFirestoreRepository {
  final FirestoreService _service = FirestoreService();

  Future addTodo(Todo todo) async {
    await _service.createTodo(todo);
  }

  Future<void> deleteTodo(Todo todo) async {
    await _service.deleteTodo(todo);
  }

  Stream<List<Todo>> getTodos() {
    return _service.getTodo();
  }

  Future<void> updateTodoStatus(String todoId, bool isCompleted) async {
    await _service.updateTodoStatus(todoId, isCompleted);
  }

  Future updateTodo(String newTodo, Todo todo) async {
    await _service.updateTodo(newTodo, todo);
  }

  Future<List<UserModel>> getUser() async {
    return await _service.getUser();
  }
}

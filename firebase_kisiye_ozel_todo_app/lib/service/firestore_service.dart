import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_kisiye_ozel_todo_app/models/todo.dart';
import 'package:firebase_kisiye_ozel_todo_app/models/user_model.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Todo>> getTodo() {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        return _firestore.collection("users").doc(currentUser.uid).collection("todos").snapshots().map((snapshot) {
          return snapshot.docs.map((doc) {
            return Todo.fromMap(doc.data(), key: doc.id);
          }).toList();
        });
      } else {
        return const Stream.empty();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future createTodo(Todo todo) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        var docId = _firestore.collection("users").doc(currentUser.uid).collection("todos").doc().id;
        return await _firestore.collection("users").doc(currentUser.uid).collection("todos").doc(docId).set(todo.toMap(key: docId));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        return await _firestore.collection("users").doc(currentUser.uid).collection("todos").doc(todo.id).delete();
      }
    } catch (e) {
      throw Exception(e.toString);
    }
  }

  Future updateTodo(String newTodo, Todo todo) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _firestore.collection("users").doc(currentUser.uid).collection("todos").doc(todo.id).update(todo.updateToMap(newTodo));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateTodoStatus(String todoId, bool isCompleted) async {
    // Firebase referansını alın
    User? currentUser = _auth.currentUser;
    var todoRef = _firestore.collection("users").doc(currentUser!.uid).collection("todos").doc(todoId);
    // Firebase'deki isCompleted alanını güncelleyin
    await todoRef.update({"isCompleted": isCompleted});
  }

  Future<List<UserModel>> getUser() async {
    User? currentUser = _auth.currentUser;
    List<UserModel> userList = [];
    userList = await _firestore
        .collection("users")
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) => value.docs.map((e) => UserModel.fromMap(e.data(), key: e.id)).toList());
    return userList;
  }
}

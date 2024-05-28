class Todo {
  dynamic id;
  String todo;
  bool isCompleted;

  Todo({this.id, required this.todo, required this.isCompleted});

  factory Todo.fromMap(Map<String, dynamic> map, {dynamic key}) {
    return Todo(
      id: key ?? map["id"],
      todo: map['todo'],
      isCompleted: map['isCompleted'],
    );
  }

  Map<String, dynamic> toMap({dynamic key}) {
    return {
      "id": key ?? id,
      "todo": todo,
      "isCompleted": isCompleted,
    };
  }

  Map<String, dynamic> updateToMap(String newTodo, {dynamic key}) {
    return {
      "id": key ?? id,
      "todo": newTodo,
      "isCompleted": isCompleted,
    };
  }
}

import 'package:flutter_stmgt/model/Todo.dart';

class TodoRepository {

  Future<List<Todo>> getTodos() async {
    return Future.delayed(const Duration(seconds: 2), () => [
      Todo(title: "This is the todo from server", completed: false),
      Todo(title: "This is the another todo from server", completed: false),
    ],);
  }
}

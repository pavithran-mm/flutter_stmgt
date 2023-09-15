import 'package:flutter/material.dart';
import 'package:flutter_stmgt/repository/todo_repository.dart';

import '../model/Todo.dart';

class TodoProviderModel extends ChangeNotifier {

  List<Todo> _todos = [];
  bool isLoading = false;
  TextEditingController textController = TextEditingController();
  TodoRepository todoRepository = TodoRepository();
  List<Todo> get todos => _todos;

  void fetchTodos() async {
    isLoading = true;
    notifyListeners();
    List<Todo> todos = await todoRepository.getTodos();
    _todos = todos;
    isLoading = false;
    notifyListeners();
  }

  TodoProviderModel() {
    fetchTodos();
  }

  void addTodo() {
    final todoText = textController.text;
    if (todoText.isNotEmpty) {
      Todo todo = Todo(title: todoText, completed: false);
        _todos.add(todo);
        textController.clear();
        notifyListeners();
    }
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

}
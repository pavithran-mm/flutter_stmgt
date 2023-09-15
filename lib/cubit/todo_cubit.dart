
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stmgt/cubit/todo_state.dart';
import 'package:flutter_stmgt/repository/todo_repository.dart';

import '../model/Todo.dart';

class TodoCubit extends Cubit<TodoBaseState> {
  TodoCubit(): super(TodoInitialState());

  TodoRepository todoRepository = TodoRepository();

  Future<void> fetchTodos() async {
    emit(TodoLoadingState());
    List<Todo> todos = await todoRepository.getTodos();
    emit(TodoLoadedState(todos: todos));
  }


  void addTodo(String title) {
    final todoText = title;
    if (todoText.isNotEmpty) {
      Todo todo = Todo(title: todoText, completed: false);
      TodoLoadedState currentState = state as TodoLoadedState;
      currentState.todos.add(todo);
      emit(TodoLoadedState(todos: currentState.todos));
    }
  }

  void removeTodo(int index) {
    TodoLoadedState currentState = state as TodoLoadedState;
    currentState.todos.removeAt(index);
    emit(TodoLoadedState(todos: currentState.todos));
  }
}
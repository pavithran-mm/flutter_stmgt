import "package:flutter_stmgt/model/Todo.dart";

abstract class TodoBaseState {}

class TodoInitialState extends TodoBaseState {}

class TodoLoadingState extends TodoBaseState {}

class TodoLoadedState extends TodoBaseState {
  late final List<Todo> todos;

  TodoLoadedState({required this.todos});
}

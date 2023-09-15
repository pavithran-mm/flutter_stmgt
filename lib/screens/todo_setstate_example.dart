import 'package:flutter/material.dart';

import '../model/Todo.dart';
import '../repository/todo_repository.dart';

class TodoSetStateExample extends StatefulWidget {
  const TodoSetStateExample({Key? key}) : super(key: key);

  @override
  State<TodoSetStateExample> createState() => _TodoSetStateExampleState();
}

class _TodoSetStateExampleState extends State<TodoSetStateExample> {
  List<Todo> _todos = [];
  bool _isLoading = true;
  final TextEditingController _textController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  @override
  void initState() {
    super.initState();
    _getTodos();
  }

  void _addTodo() {
    final todoText = _textController.text;
    if (todoText.isNotEmpty) {
      Todo todo = Todo(title: todoText, completed: false);
      setState(() {
        _todos.add(todo);
        _textController.clear();
      });
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _getTodos() async {
    List<Todo> todos = await todoRepository.getTodos();
    setState(() {
      _isLoading = false;
      _todos = todos;
    });
  }

  @override
  void didUpdateWidget(covariant TodoSetStateExample oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo example with setState"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration:
                              const InputDecoration(labelText: 'Add a to-do'),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _addTodo,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_todos[index].title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeTodo(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

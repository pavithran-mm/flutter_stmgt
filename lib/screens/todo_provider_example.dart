import 'package:flutter/material.dart';
import 'package:flutter_stmgt/notifiers/TodoProviderNotifier.dart';
import 'package:provider/provider.dart';

class TodoProviderExample extends StatefulWidget {
  const TodoProviderExample({Key? key}) : super(key: key);

  @override
  State<TodoProviderExample> createState() => _TodoProviderExampleState();
}

class _TodoProviderExampleState extends State<TodoProviderExample> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProviderModel>(builder: (context, todoProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Todo example with Provider"),
        ),
        body: todoProvider.isLoading
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
                            controller: todoProvider.textController,
                            decoration:
                                const InputDecoration(labelText: 'Add a to-do'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: todoProvider.addTodo,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todoProvider.todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todoProvider.todos[index].title),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => todoProvider.removeTodo(index),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      );
    });
  }
}

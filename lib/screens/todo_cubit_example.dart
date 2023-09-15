import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stmgt/cubit/todo_cubit.dart';
import 'package:flutter_stmgt/cubit/todo_state.dart';

class TodoCubitExample extends StatefulWidget {
  const TodoCubitExample({Key? key}) : super(key: key);

  @override
  State<TodoCubitExample> createState() => _TodoCubitExampleState();
}

class _TodoCubitExampleState extends State<TodoCubitExample> {

  late TodoCubit _todoCubit;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todoCubit = TodoCubit();
    _todoCubit.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo example with Cubit"),
      ),
      body: Column(
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
                  onPressed: () {
                    _todoCubit.addTodo(_textController.text);
                    _textController.clear();
                  },
                ),
              ],
            ),
          ),
          BlocBuilder(
              bloc: _todoCubit,
              builder: (context, state) {
                if (state is TodoLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is TodoLoadedState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.todos[index].title),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _todoCubit.removeTodo(index),
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox();
              })
        ],
      ),
    );
  }
}

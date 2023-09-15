import 'package:flutter/material.dart';
import 'package:flutter_stmgt/notifiers/TodoProviderNotifier.dart';
import 'package:flutter_stmgt/screens/todo_cubit_example.dart';
import 'package:flutter_stmgt/screens/todo_provider_example.dart';
import 'package:flutter_stmgt/screens/todo_setstate_example.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProviderModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TodoSetStateExample()));
                },
                child: const Text("setState Example")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TodoProviderExample()));
                },
                child: const Text("Provider Example")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TodoCubitExample()));
                },
                child: const Text("Cubit/BLoC Example")),
          ],
        ),
      ),
    );
  }
}

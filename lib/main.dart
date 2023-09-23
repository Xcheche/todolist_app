import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //initial varibale
  final List<String> _todos = ['task1', 'task2', 'task3', 'task4'];
  // Dialog Box Pop-up
  // Text input --> add to the _todos
  void _addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTodo = '';

          return AlertDialog(
            title: const Text('Enter New Task Below:'),
            content: TextField(
              onChanged: (value) {
                newTodo = value;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _todos.add(newTodo);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Submit'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(
              todo,
              style: TextStyle(
                  decoration: todo.startsWith('-')
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            onTap: () {
              setState(() {
                // _todos.removeAt(index);
                if (todo.startsWith('-')) {
                  _todos[index] = todo.substring(2);
                } else {
                  _todos[index] = '- $todo';
                }
              });
            }, // Use the 'todo' variable here
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.grey,
        onPressed: () {
          _addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  // ListView.builder --> ListTitle _todos
}

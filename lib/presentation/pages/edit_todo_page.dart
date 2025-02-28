import 'package:flutter/material.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Edit todo page"),
    );
  }
}

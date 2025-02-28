import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNavyBlue,
        foregroundColor: kWhite,
        title: Text('ADD'),
      ),
      body: Text('Add todo page'),
    );
  }
}

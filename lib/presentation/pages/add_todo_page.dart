import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/logic/todo_bloc/todo_state.dart';
import 'package:todo/presentation/widgets/confirmational_modal.dart'
    show confirmationModal;
import 'package:todo/presentation/widgets/custom_button.dart';
import 'package:todo/logic/todo_bloc/todo_bloc.dart';
import 'package:todo/logic/todo_bloc/todo_event.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:quickalert/quickalert.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController _todoController = TextEditingController();

  void _addTodo() {
    final String text = _todoController.text.trim();
    if (text.isNotEmpty) {
      context.read<TodoBloc>().add(AddTodo(TodoModel(title: text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is AddTodoSuccess) {
          confirmationModal(
            context: context,
            onConfirm: () {
              Navigator.pop(context);
            },
            title: "Success",
            message: "Todo Added successfully",
            confirmButtonLabel: "Okay",
            type: QuickAlertType.success,
          );
        } else if (state is AddTodoFailure) {
          confirmationModal(
            context: context,
            onConfirm: () {
              Navigator.pop(context);
            },
            title: "Error",
            message: "Error in adding Todo",
            confirmButtonLabel: "Okay",
            type: QuickAlertType.error,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kNavyBlue,
          foregroundColor: kWhite,
          title: Text('Add Todo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: _todoController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Write your task here...",
                    filled: true,
                    fillColor: kWhite,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: kGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: kNavyBlue, width: 1),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  cursorColor: kNavyBlue,
                  style: TextStyle(color: kNavyBlue), // Text color
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                callBackFunction: _addTodo,
                label: "Add",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

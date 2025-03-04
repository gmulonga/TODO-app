import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/logic/todo_bloc/todo_state.dart';
import 'package:todo/presentation/widgets/confirmational_modal.dart';
import 'package:todo/presentation/widgets/custom_button.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/logic/todo_bloc/todo_bloc.dart';
import 'package:todo/logic/todo_bloc/todo_event.dart';
import 'package:quickalert/quickalert.dart';

class EditTodoPage extends StatefulWidget {
  final TodoModel todo;

  const EditTodoPage({super.key, required this.todo});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController _todoController;

  @override
  void initState() {
    super.initState();
    _todoController = TextEditingController(text: widget.todo.title);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is TodoModel) {
      setState(() {
        var todo = args;
        _todoController.text = widget.todo!.title;
      });
    }
  }

  void updateTodo() {
    if (_todoController.text.isNotEmpty && widget.todo != null) {
      final updatedTodo = widget.todo!.copyWith(title: _todoController.text);
      context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
    }
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is UpdateTodoSuccess) {
          confirmationModal(
            context: context,
            onConfirm: () {
              Navigator.pop(context);
            },
            title: "Success",
            message: "Todo updated successfully",
            confirmButtonLabel: "Okay",
            type: QuickAlertType.success,
          );
        } else if (state is UpdateTodoFailure) {
          confirmationModal(
            context: context,
            onConfirm: () {},
            title: "Error",
            message: "Failed to update Todo",
            confirmButtonLabel: "Okay",
            type: QuickAlertType.error,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kNavyBlue,
          foregroundColor: kWhite,
          title: const Text('Edit Todo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                controller: _todoController,
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kNavyBlue, width: 1),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
                cursorColor: kNavyBlue,
                style: const TextStyle(color: kNavyBlue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                callBackFunction: updateTodo,
                label: "Save Changes",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

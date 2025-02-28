import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/presentation/widgets/custom_button.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kNavyBlue,
          foregroundColor: kWhite,
          title: Text('Eit Todo'),
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
                    // hintText: "Write your task here...",
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
                      borderSide: BorderSide(
                          color: kNavyBlue,
                          width: 1), // Border color when focused
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  cursorColor: kNavyBlue,
                  // Cursor color when typing
                  style: TextStyle(color: kNavyBlue), // Text color
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  callBackFunction: () {},
                  label: "Edit",
                )),
          ],
        ));
  }
}

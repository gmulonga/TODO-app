import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/data/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoTile(
      {Key? key,
      required this.todo,
      required this.onCheckboxChanged,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Container(
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4))
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: kGrey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: kGrey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: kNavyBlue,
                  value: todo.isChecked,
                  onChanged: (bool) {},
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Text(todo.title),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

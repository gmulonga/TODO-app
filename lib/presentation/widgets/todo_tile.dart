import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/data/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoTile({
    Key? key,
    required this.todo,
    required this.onCheckboxChanged,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: kGreen,
              value: todo.isChecked,
              onChanged: onCheckboxChanged,
            ),
            Expanded(
              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration:
                      todo.isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: kNavyBlue),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: kRed),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

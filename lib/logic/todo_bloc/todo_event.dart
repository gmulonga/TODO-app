import '../../data/models/todo_model.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  AddTodo(this.todo);
}

class EditTodo extends TodoEvent {
  final TodoModel todo;

  EditTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final int id;

  DeleteTodo(this.id);
}

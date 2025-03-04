import '../../data/models/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}

class UpdateTodoSuccess extends TodoState {}

class UpdateTodoFailure extends TodoState {
  final String message;

  UpdateTodoFailure(this.message);
}

class AddTodoSuccess extends TodoState {}

class AddTodoFailure extends TodoState {
  final String message;

  AddTodoFailure(this.message);
}

class DeleteTodoSuccess extends TodoState {}

class DeleteTodoFailure extends TodoState {
  final String message;

  DeleteTodoFailure(this.message);
}

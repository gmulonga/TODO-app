import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/todo_model.dart';
import '../../data/repositories/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      try {
        final todos = await todoRepository.getTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError("Failed to load todos"));
      }
    });

    on<AddTodo>((event, emit) async {
      try {
        await todoRepository.addTodo(event.todo);
        final todos = await todoRepository.getTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError("Failed to add todo"));
      }
    });

    on<UpdateTodo>((event, emit) async {
      try {
        await todoRepository.updateTodo(event.todo);
        final todos = await todoRepository.getTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError("Failed to update todo"));
      }
    });

    on<DeleteTodo>((event, emit) async {
      try {
        await todoRepository.deleteTodo(event.todo);
        final todos = await todoRepository.getTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError("Failed to delete todo"));
      }
    });
  }
}

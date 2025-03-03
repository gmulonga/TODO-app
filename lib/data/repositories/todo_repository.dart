import '../../core/services/local_storage.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final LocalDatabase localDatabase = LocalDatabase.instance;

  Future<void> addTodo(TodoModel todo) async {
    await localDatabase.insertTodo(todo);
  }

  Future<List<TodoModel>> getTodos() async {
    return await localDatabase.fetchTodos();
  }

  Future<void> updateTodo(TodoModel todo) async {
    await localDatabase.updateTodo(todo);
  }

  Future<void> deleteTodo(TodoModel todo) async {
    await localDatabase.deleteTodo(todo);
  }
}

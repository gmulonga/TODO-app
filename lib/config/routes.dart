import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/home_page.dart';
import 'package:todo/presentation/pages/add_todo_page.dart';
import 'package:todo/presentation/pages/edit_todo_page.dart';
import 'package:todo/data/models/todo_model.dart';

class AppRoutes {
  static const String home = '/';
  static const String addTodo = '/add-todo';
  static const String editTodo = '/edit-todo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case addTodo:
        return MaterialPageRoute(builder: (_) => const AddTodoPage());

      case editTodo:
        final args = settings.arguments as TodoModel;
        return MaterialPageRoute(builder: (_) => EditTodoPage(todo: args));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}

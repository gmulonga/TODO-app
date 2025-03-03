import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/logic/todo_bloc/todo_bloc.dart';
import 'package:todo/data/repositories/todo_repository.dart';
import 'package:todo/app.dart';
import 'package:todo/logic/todo_bloc/todo_event.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TodoBloc(TodoRepository())..add(LoadTodos()),
      child: MyApp(),
    ),
  );
}

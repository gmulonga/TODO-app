import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:todo/logic/todo_bloc/todo_state.dart';
import 'package:todo/presentation/widgets/todo_tile.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/presentation/widgets/searchbar.dart';
import 'package:todo/presentation/pages/add_todo_page.dart';
import 'package:animations/animations.dart';
import 'package:todo/logic/todo_bloc/todo_bloc.dart';
import 'package:todo/logic/todo_bloc/todo_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(LoadTodos());
  }

  void toggleCheckbox(TodoModel todo, bool? value) {
    final updatedTodo = todo.copyWith(isChecked: value ?? false);
    context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
  }

  void editTodo(TodoModel todo) {
    Navigator.pushNamed(
      context,
      "/edit-todo",
      arguments: todo,
    );
  }

  void deleteTodo(int index) {
    context.read<TodoBloc>().add(DeleteTodo(index));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _textController = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: kNavyBlue,
                height: screenHeight * 0.2,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "TODO",
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sunny, color: kWhite),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                bottom: -25,
                child: Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Searchbar(controller: _textController),
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        todo: state.todos[index],
                        onCheckboxChanged: (value) =>
                            toggleCheckbox(state.todos[index], value),
                        onEdit: () => editTodo(state.todos[index]),
                        onDelete: () => deleteTodo(index),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No todos found"));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        closedShape: const CircleBorder(),
        closedElevation: 6,
        closedColor: kNavyBlue,
        openColor: Colors.white,
        closedBuilder: (context, openContainer) {
          return FloatingActionButton(
            backgroundColor: kNavyBlue,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: kWhite),
            onPressed: openContainer,
          );
        },
        openBuilder: (context, closeContainer) {
          return const AddTodoPage();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TODO",
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.sunny, color: kWhite),
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
                        offset: Offset(0, 2),
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
                  return Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        todo: state.todos[index],
                      );
                    },
                  );
                } else {
                  return Center(child: Text("No todos found"));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: Duration(milliseconds: 500),
        closedShape: CircleBorder(),
        closedElevation: 6,
        closedColor: kNavyBlue,
        openColor: Colors.white,
        closedBuilder: (context, openContainer) {
          return FloatingActionButton(
            backgroundColor: kNavyBlue,
            shape: CircleBorder(),
            child: Icon(Icons.add, color: kWhite),
            onPressed: openContainer,
          );
        },
        openBuilder: (context, closeContainer) {
          return AddTodoPage();
        },
      ),
    );
  }
}

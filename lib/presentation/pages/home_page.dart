import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Manage your daily tasks",
                style: TextStyle(fontSize: 20),
              ),
            ),
            todoTile(),
            todoTile(),
            todoTile()
          ],
        ),
      ),
    );
  }
}

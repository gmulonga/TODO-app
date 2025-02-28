import 'package:flutter/material.dart';

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
          children: [
            Center(
              child: Text(
                "Manage your daily tasks",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: ,
            )
          ],
        ),
      ),
    );
  }
}

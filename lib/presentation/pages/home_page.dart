import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/todo_tile.dart';
import 'package:todo/core/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: kNavyBlue,
            height: screenHeight * 0.2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TODO",
                    style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sunny,
                        color: kWhite,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          todoTile(),
          todoTile(),
          todoTile()
        ],
      ),
    );
  }
}

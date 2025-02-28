import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/todo_tile.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/presentation/widgets/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            clipBehavior: Clip.none, // Ensures the search bar isn't clipped
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
                left: screenWidth * 0.05, // Centering horizontally
                right: screenWidth * 0.05,
                bottom: -25, // Overlapping the container
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
          SizedBox(height: 35), // Adjust spacing to accommodate search bar
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 0),
              children: [
                todoTile(),
                todoTile(),
                todoTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

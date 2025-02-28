import 'package:todo/core/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    required this.callBackFunction,
  });

  final VoidCallback callBackFunction;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.callBackFunction();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kNavyBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 17),
        child: Text(
          "ADD",
          style: TextStyle(color: kWhite, fontSize: 15),
        ),
      ),
    );
  }
}

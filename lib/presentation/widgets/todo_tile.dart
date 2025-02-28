import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';

class todoTile extends StatelessWidget {
  const todoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Container(
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4))
            ]),
        child: Row(
          children: [
            Checkbox(
              activeColor: kNavyBlue,
              value: true,
              onChanged: (bool) {},
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                    'This is a sample to is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

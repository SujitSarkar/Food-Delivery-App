import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final textStyle = TextStyle(
        fontSize: size.width / 11, fontWeight: FontWeight.w500);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'What would',
                  style: textStyle
              ),
              Text(
                  'You like to eat?',
                  style: textStyle
              ),
            ],
          ),
        ],
      ),
    );
  }
}

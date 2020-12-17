import 'package:flutter/material.dart';

class ViewAllFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Frequently bought food',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: size.width / 21),
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            'View all',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w500,
                fontSize: size.width / 21),
          ),
        ),
      ],
    );;
  }
}


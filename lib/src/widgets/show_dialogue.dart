import 'package:flutter/material.dart';

Future<void> showLoadingDialog(BuildContext context, String messege) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text(messege),
            ],
          ),
        );
      });
}
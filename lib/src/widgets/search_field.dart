import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search any food',
            contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
            suffixIcon: Material(
                elevation: 3,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: IconButton(
                  onPressed: (){},
                  splashRadius: 24,
                  splashColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.search_rounded,
                    color: Colors.black54,),
            )),
            border: InputBorder.none),
      ),
    );
  }
}

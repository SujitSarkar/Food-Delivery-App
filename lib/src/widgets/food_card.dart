import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {

  final String categoryName;
  final String imagePath;
  final int numberOfItems;
  FoodCard({this.categoryName,this.imagePath,this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            children: [
              Image(
                image: AssetImage(imagePath),
                height: size.height/12,
                width: size.width/5,
              ),
              SizedBox(width: size.width/30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: size.width / 25),
                  ),
                  Text("$numberOfItems kinds"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

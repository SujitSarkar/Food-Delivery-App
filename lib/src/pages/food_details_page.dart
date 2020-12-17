import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/models/food_model.dart';

// ignore: must_be_immutable
class FoodDetailsPage extends StatelessWidget {
  final Food food;
  FoodDetailsPage({this.food});

  var _mediumSpace = SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Food details",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: size.width,
                  child: Image.asset("assets/images/lunch.jpeg", fit: BoxFit.cover),
                ),
                _mediumSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(food.name, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("\u{20b5}${food.price}",style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor),),
                  ],
                ),
                _mediumSpace,
                Text("Description:",style: TextStyle(fontSize: 16)),
                _mediumSpace,
                Text(food.description,
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.add_circle), onPressed: null),
                    SizedBox(width: 20),
                    Text("12"),
                    SizedBox(width: 20),
                    IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
                  ],
                ),
                _mediumSpace,
                _mediumSpace,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: ThemeData().primaryColor,
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: size.width / 20),
                    ),
                  ),
                ),
                _mediumSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}


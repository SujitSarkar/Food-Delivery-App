import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/pages/food_details_page.dart';
import 'package:food_delivery_app/src/scoped_model/main_model.dart';
import 'package:food_delivery_app/src/widgets/bought_food.dart';
import 'package:food_delivery_app/src/widgets/view_all_food.dart';
import 'package:food_delivery_app/src/widgets/food_category.dart';
import 'package:food_delivery_app/src/widgets/home.top.info.dart';
import 'package:food_delivery_app/src/widgets/search_field.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  // final FoodModel foodModel;
  // HomePage(this.foodModel);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        children: [
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 10),
          SearchField(),
          SizedBox(height: 20),
          ViewAllFood(),
          SizedBox(height: 20),

          ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
            return Column(
              children:
              model.foods.map(_buildFoodItems).toList(),
            );
          })
        ],
      ),
    );
  }

  ///Widget must be mentioned before the function
  Widget _buildFoodItems(Food food){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            FoodDetailsPage(food: food,)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          category: food.category,
          price: food.price,
          imagePath: "assets/images/breakfast.jpeg",
          discount: food.discount,
          ratings: food.ratings,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/admin/pages/add_food_item.dart';
import 'package:food_delivery_app/src/scoped_model/main_model.dart';
import 'package:food_delivery_app/src/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: mainModel,
        child: MaterialApp(
          title: 'Food Delivery App',
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          home: MainScreen(model: mainModel),
          // home: AddFoodItem(),
        ));
  }
}

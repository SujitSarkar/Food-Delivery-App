import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/models/food_model.dart';
import 'package:food_delivery_app/src/scoped_model/main_model.dart';
import 'package:food_delivery_app/src/widgets/show_dialogue.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  final Food food;

  AddFoodItem({this.food});

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  String title;
  File imagePath;
  String category;
  String price;
  String discount;
  String description;

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   Navigator.of(context).pop(false);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: (){
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.food != null ? "Update Food Item" : "Add Food Item",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(false),
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
          key: _scaffoldStateKey,
          body: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            width: size.width,
            height: size.height,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width,
                        height: size.height / 3.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ThemeData().primaryColor),
                            image: DecorationImage(
                              image: AssetImage("assets/images/no-image.png"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(height: size.width / 10),
                    _buildTextFormField("Food Title"),
                    SizedBox(height: size.width / 20),
                    _buildTextFormField("Price"),
                    SizedBox(height: size.width / 20),
                    _buildTextFormField("Category"),
                    SizedBox(height: size.width / 20),
                    _buildTextFormField("Discount"),
                    SizedBox(height: size.width / 20),
                    _buildTextFormField("Description", 5),
                    SizedBox(height: size.width / 10),
                    ScopedModelDescendant(
                      builder:
                          (BuildContext context, Widget child, MainModel model) {
                        return GestureDetector(
                          onTap: () {
                            onSubmit(model.addFood, model.updateFood);
                            if (model.isLoading) {
                              //Show Loading progress indicator...
                              showLoadingDialog(context, widget.food!=null?"Updating food...": "Adding food...");
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: ThemeData().primaryColor,
                            ),
                            child: Text(
                              widget.food != null
                                  ? "Update Food Item"
                                  : "Add Food Item",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: size.width / 20),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.width / 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  void onSubmit(Function addFood, Function updateFood) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if(widget.food!=null){
        //I want to update food item
        Map<String, dynamic> updatedFoodItem = {
          'title': title,
          'category': category,
          'description': description,
          'price': double.parse(price),
          'discount': discount!=null ? double.parse(discount):0.0,
        };

        final bool response = await updateFood(updatedFoodItem, widget.food.id);
        if(response){
          Navigator.of(context).pop(); ///Remove the loading dialogue
          Navigator.of(context).pop(response); /// go back to previous page
        }
        else{
          Navigator.of(context).pop();
          SnackBar snackBar =
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Failed to update Food item",
              style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
            backgroundColor: Colors.red,
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
      else if(widget.food == null){
        final Food food = Food(
          name: title,
          discount: double.parse(discount),
          description: description,
          price: double.parse(price),
          category: category,
        );
        bool value = await addFood(food);
        if (value) {
          Navigator.of(context).pop();
          SnackBar snackBar =
          SnackBar(content: Text("Food item Successfully added"));
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text("Failed to add food item"));
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }

  Widget _buildTextFormField(String hint, [int maxLine = 1]) {
    return TextFormField(
      initialValue: widget.food != null && hint == 'Food Title'
          ? widget.food.name
          : widget.food != null && hint == 'Price'
              ? widget.food.price.toString()
              : widget.food != null && hint == 'Category'
                  ? widget.food.category
                  : widget.food != null && hint == 'Discount'
                      ? widget.food.discount.toString()
                      : widget.food != null && hint == 'Description'
                          ? widget.food.description
                          : "",
      decoration: InputDecoration(
        hintText: hint,
      ),
      maxLines: maxLine,
      keyboardType: hint == 'Price' || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String val) => val.isEmpty ? "Enter $hint" : null,
      onSaved: (String val) {
        switch (hint) {
          case 'Food Title':
            title = val;
            break;
          case 'Price':
            price = val;
            break;
          case 'Category':
            category = val;
            break;
          case 'Description':
            description = val;
            break;
          case 'Discount':
            discount = val;
            break;
        }
      },
    );
  }
}

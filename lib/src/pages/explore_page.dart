import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/admin/pages/add_food_item.dart';
import 'package:food_delivery_app/src/scoped_model/main_model.dart';
import 'package:food_delivery_app/src/widgets/food_item_card.dart';
import 'package:food_delivery_app/src/widgets/show_dialogue.dart';
import 'package:scoped_model/scoped_model.dart';

// ignore: must_be_immutable
class FavoritePage extends StatefulWidget {
  final MainModel model;

  FavoritePage({this.model});



  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {


  ///the Scaffold global key
  GlobalKey<ScaffoldState> _explorePageKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _explorePageKey,
        backgroundColor: Colors.white,
        body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext sctx, Widget child, MainModel model) {
            //model.fetchFoods(); //this will fetch and call notifyListeners()
            //List<Food> foods = model.foods;
            return RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView.builder(
                itemCount: model.foodLength,
                itemBuilder: (BuildContext lclx, int index) {
                  return GestureDetector(
                    onTap: () async {
                      final bool response = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFoodItem(
                                    food: model.foods[index],
                                  )));
                      if(response){
                        SnackBar snackBar =
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Food item successfully updated",
                            style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                          backgroundColor: Theme.of(context).primaryColor,
                        );

                        _explorePageKey.currentState.showSnackBar(snackBar);
                      }else{

                      }
                    },
                    // onLongPress: (){
                    //   ///Show Alert Dialog....
                    //   showDialog(
                    //       context: context,
                    //       barrierDismissible: false,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           title: Text("Delete this item?",
                    //             textAlign: TextAlign.center,),
                    //           content: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               FlatButton(
                    //                 color: Colors.deepOrange,
                    //                 onPressed: () {
                    //                   Navigator.of(context).pop();
                    //                   ///Delete food item
                    //                   showLoadingDialog(context, "Deleting food...");
                    //                   model.deleteFood(model.foods[index].id).then((bool response) {
                    //                     Navigator.of(context).pop();
                    //                     Navigator.of(context).pop();
                    //                   });
                    //                 },
                    //                 splashColor: Colors.deepOrange[300],
                    //                 child: Text(
                    //                   "Yes",
                    //                   style: TextStyle(color: Colors.white),
                    //                 ),
                    //               ),
                    //               SizedBox(width: 20),
                    //               FlatButton(
                    //                 color: Theme.of(context).primaryColor,
                    //                 onPressed: () {
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 splashColor: Colors.blue[300],
                    //                 child: Text(
                    //                   "No",
                    //                   style: TextStyle(color: Colors.white),
                    //                 ),
                    //               ),
                    //             ],
                    //           )
                    //         );
                    //       });
                    // },
                    onDoubleTap: (){
                      ///Delete food item
                      showLoadingDialog(context, "Deleting food...");
                      model.deleteFood(model.foods[index].id).then((bool response) {
                        Navigator.of(context).pop();
                      });
                    },
                    child: FoodItemCard(
                      model.foods[index].name,
                      model.foods[index].description,
                      model.foods[index].price.toString(),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}

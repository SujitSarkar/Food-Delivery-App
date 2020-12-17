import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/admin/pages/add_food_item.dart';
import 'package:food_delivery_app/src/pages/explore_page.dart';
import 'package:food_delivery_app/src/pages/home_page.dart';
import 'package:food_delivery_app/src/pages/order_page.dart';
import 'package:food_delivery_app/src/pages/profile_page.dart';
import 'package:food_delivery_app/src/scoped_model/main_model.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;

  @override
  void initState() {
    ///Call the MainModel from scoped_model...
    widget.model.fetchFoods();
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage(model: widget.model);
    profilePage = ProfilePage();
    pages = [homePage, favoritePage, orderPage, profilePage];
    currentPage = homePage;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.model.fetchFoods();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            currentTabIndex == 0
                ? "Food App"
                : currentTabIndex == 1
                    ? "All Food Items"
                    : currentTabIndex == 2
                        ? "Order List"
                        : "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(icon: Icon(Icons.notifications_none,
              color: Theme.of(context).primaryColor,size: 30.0,),
                onPressed:(){}
            ),
            IconButton(icon: _buildShoppingCart(),
                onPressed:(){}
            ),

          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddFoodItem()));
                },
                leading: Icon(Icons.list),
                title: Text(
                  "Add Food Item",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        body: currentPage,
      ),
    );
  }

  Widget _buildShoppingCart(){
    return Stack(
      children: [
        Icon(Icons.add_shopping_cart_outlined,
          color: Theme.of(context).primaryColor,size: 30.0,
        ),
        Positioned(
          right: 0,
            top: 0,
            child: Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(8.0),
                color: Colors.red
              ),
              child: Center(
                child: Text("7+",style: TextStyle(color: Colors.white,fontSize: 8),),
              )
            )
        )
      ],
    );
  }
}

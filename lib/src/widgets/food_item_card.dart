import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  FoodItemCard(this.title,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0.5),
                color: Colors.black38)
          ]),
      child: Row(
        children: [
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/breakfast.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(width: size.width / 22),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: size.width / 22),
                  ),
                  SizedBox(height: size.height/70,),
                  Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: size.width / 30,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: size.height/50,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\u0024 $price",
                          style: TextStyle(
                              color: ThemeData().primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: ThemeData().primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Buy',
                            style: TextStyle(
                                color: ThemeData().primaryColor,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

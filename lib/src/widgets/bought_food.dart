import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoughtFoods extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;
  BoughtFoods({this.id,this.name,this.imagePath,this.category,this.price,this.discount,this.ratings});

  @override
  _BoughtFoodsState createState() => _BoughtFoodsState();
}

class _BoughtFoodsState extends State<BoughtFoods> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Stack(
        children: [
          Container(
            height: size.height / 3,
            width: size.width,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: size.height / 12,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black,
                Colors.black12,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Text(
                          '(${widget.ratings} Reviews)',
                          style: TextStyle(color: Colors.grey[400],),
                        ),
                      ],
                    )
                  ],
                ),

                Column(
                  children: [
                    Text(
                      widget.price.toString(),
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width/20
                      ),
                    ),
                    Text(
                        'Min Order',
                        style: TextStyle(
                        color: Colors.grey[400],
                        //fontWeight: FontWeight.w500
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 20,left: 10,right: 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                  fontSize: size.width / 12, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: size.height / 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          offset: Offset(1, 2),
                          color: Colors.black),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/pizza.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: size.width / 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sujit Sarkar',
                      style: TextStyle(
                          fontSize: size.width / 20,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: size.width / 50),
                    Text(
                      '+8801929444532',
                      style: TextStyle(
                          fontSize: size.width / 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(height: size.width / 30),
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
                        'Edit',
                        style: TextStyle(
                            color: ThemeData().primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: size.height / 30),
            Text(
              'Account',
              style: TextStyle(
                  fontSize: size.width / 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: size.height / 80),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ActionFunction(Icons.location_on_outlined, 'Location'),
                    Divider(height: 20),
                    ActionFunction(
                        Icons.visibility_outlined, 'Change Password'),
                    Divider(height: 20),
                    ActionFunction(Icons.local_shipping_outlined, 'Shipping'),
                    Divider(height: 20),
                    ActionFunction(Icons.payment_outlined, 'Payment'),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height / 30),
            Text(
              'Notifications',
              style: TextStyle(
                  fontSize: size.width / 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: size.height / 80),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'App Notification',
                          style: TextStyle(
                            fontSize: size.width / 22,
                          ),
                        ),
                        Switch(
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              setState(() =>
                                  turnOnNotification = !turnOnNotification);
                            })
                      ],
                    ),
                    Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location Tracking',
                          style: TextStyle(
                            fontSize: size.width / 22,
                          ),
                        ),
                        Switch(
                            value: turnOnLocation,
                            onChanged: (bool value) {
                              setState(
                                  () => turnOnLocation = !turnOnLocation);
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height / 30),
            Text(
              "Others",
              style: TextStyle(
                  fontSize: size.width / 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: size.height / 80),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ActionFunction(Icons.language_outlined, 'Language'),
                    Divider(height: 20),
                    ActionFunction(Icons.attach_money_outlined, 'Currency'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget ActionFunction(IconData icon, String name) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Icon(
          icon,
          color: ThemeData().primaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: size.width / 22,
          ),
        )
      ],
    );
  }
}

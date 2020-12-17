import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/pages/signup_page.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _toogleVisibility = true;

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Your Email',
        hintStyle: TextStyle(color: Color(0xFFBDC2CB)),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Your Password',
        hintStyle: TextStyle(color: Color(0xFFBDC2CB)),
        suffixIcon: IconButton(
          onPressed: () {
            setState(()=> _toogleVisibility = !_toogleVisibility);
          },
          icon: _toogleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toogleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: size.width / 12),
            ),
            SizedBox(height: size.height / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: ThemeData().primaryColor,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(height: size.height / 50),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildEmailTextField(),
                    SizedBox(height: size.height / 50),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height / 30),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: ThemeData().primaryColor,
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: size.width / 20),
                ),
              ),
            ),
            SizedBox(height: size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: size.width / 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                        fontSize: size.width / 23,
                        color: ThemeData().primaryColor,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

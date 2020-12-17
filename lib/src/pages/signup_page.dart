import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/pages/signin_page.dart';
import 'package:food_delivery_app/src/scoped_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _toogleVisibility = true;
  //bool _toogleVisibility2 = true;

  String _email,_username,_password;

  final _formKey = GlobalKey<FormState>();

  Widget _buildUsernameTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: TextStyle(color: Color(0xFFBDC2CB)),
      ),
      onSaved: (String username){
        _username = username;
      },
      validator: (String username){
        String errorMessage;
        if(username.isEmpty){
          errorMessage = "Username field is required";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Your Email',
        hintStyle: TextStyle(color: Color(0xFFBDC2CB)),
      ),
      onSaved: (String email){
        _email = email;
      },
      validator: (String email){
        String errorMessage;
        if(email.isEmpty){
          errorMessage = "Email field is required";
        }
        if(!email.contains("@")){
          errorMessage = "Email address is incorrect, '@' is missing";
        }
        return errorMessage;
      },
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
            setState(() => _toogleVisibility = !_toogleVisibility);
          },
          icon: _toogleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toogleVisibility,
      onSaved: (String password){
        _password = password;
      },
      validator: (String password){
        String errorMessage;
        if(password.isEmpty){
          errorMessage = "Password field is required";
        }
        if(password.length < 8){
          errorMessage = "Password must be 8 character";
        }
        return errorMessage;
      },
    );
  }

  // Widget _buildConfirmPasswordTextField() {
  //   return TextFormField(
  //     keyboardType: TextInputType.visiblePassword,
  //     decoration: InputDecoration(
  //       hintText: 'Confirm Password',
  //       hintStyle: TextStyle(color: Color(0xFFBDC2CB)),
  //       suffixIcon: IconButton(
  //         onPressed: () {
  //           setState(() => _toogleVisibility2 = !_toogleVisibility2);
  //         },
  //         icon: _toogleVisibility2
  //             ? Icon(Icons.visibility_off)
  //             : Icon(Icons.visibility),
  //       ),
  //     ),
  //     obscureText: _toogleVisibility2,
  //     onSaved: (String confirmPassword){
  //       _confirmPassword = confirmPassword;
  //     },
  //     validator: (String conformPassword){
  //       String errorMessage;
  //       if(conformPassword.isEmpty){
  //         errorMessage = "Confirm password field is required";
  //       }
  //       if(conformPassword.length < 8){
  //         errorMessage = "Confirm password is too short";
  //       }
  //       return errorMessage;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: size.width / 12),
                ),
                SizedBox(height: size.height / 10),
                Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildUsernameTextField(),
                        SizedBox(height: size.height / 50),
                        _buildEmailTextField(),
                        SizedBox(height: size.height / 50),
                        _buildPasswordTextField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height / 30),
                _buildSignupButton(),
                SizedBox(height: size.height / 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: size.width / 23,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        " Sign In",
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
        ),
      ),
    );
  }

  Widget _buildSignupButton() {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant(
        builder: (BuildContext sctx, Widget child, MainModel model){
          return GestureDetector(
            onTap: (){
              onSubmit(model.authenticate);
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
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: size.width / 20),
              ),
            ),
          );
        }
    );
  }

  void onSubmit(Function authenticate){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("Username: $_username; Email: $_email; Password: $_password");
      authenticate(_email, _password);
    }

  }
}

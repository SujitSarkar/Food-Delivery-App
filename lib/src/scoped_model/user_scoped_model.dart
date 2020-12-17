import 'package:food_delivery_app/src/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserModel extends Model{
  User _authenticatedUser;

  void authenticate(String email, String password) async{

    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
    try{
      http.Response response = await  http.post('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB1sevoN9dGGEwlRn5NpIcntPU_4cAynNE',
          body: json.encode(authData),
          headers: {'Content-Type': 'application/json'},
      );

      Map<String, dynamic> responseBody = json.decode(response.body);

      print("Printing user token here: ${responseBody['id']}");
    }catch(error){
      print("The error signing up: $error");
    }
  }
}
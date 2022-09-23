import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/disland_screen.dart';
import 'package:newproject/main_screens/tour_screen.dart';
import 'package:newproject/models/login_response.dart';

import '../navigationbar/navigationbar.dart';

class LoginProvider extends ChangeNotifier{
  String email = "";

  String password = "";

  double height=300.h;
  LoginResponse? loginResponse;

  bool isPassword=true;
  bool isLoading=false;



void changeEmail(String value){
  email=value;
  notifyListeners();
}
void changePassword(String value){
  password=value;
  notifyListeners();
}

void animtedHeight(double height){
    this.height=height;
    notifyListeners();
}

void normalHeight(double height){
  this.height=height;
   notifyListeners();
}

  void changeLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  void boolIsPassword(bool value){
  isPassword=value;
  notifyListeners();
  }

Future login(BuildContext context) async{
 isLoading=true;
Response response=await post(Uri.parse(logInUrl),body: {
"email":email,
"password":password
});
 dynamic json=jsonDecode(response.body);
 if(response.statusCode==200){
   loginResponse=LoginResponse.fromJson(json);
   Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBars(token: loginResponse!.data!.accessToken,)));
 }else{
print(json["message"]);
 }


 isLoading=false;

}

}
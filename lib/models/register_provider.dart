import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/tour_screen.dart';


import '../navigationbar/navigationbar.dart';
import 'RegisterResponse.dart';

class RegisterProvider extends ChangeNotifier{
  String email = "", password = "", name = "", phone = "";

  bool isCheckedBox = false, isPassword=true,isLoading=false;
  double height=390.h;
  RegisterResponse? registerResponseModel;
  

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
  void changeName(String value){
    name=value;
    notifyListeners();
  }
  void isChecked(bool value){
    isCheckedBox=value;
    notifyListeners();
  }
  void fIsLoaiding(bool value){
    isLoading=value;
    notifyListeners();
  }
  
  void fIsPassword(bool value){
    isPassword=value;
    notifyListeners();
  }
  
  Future Register(BuildContext context)  async {
    isLoading=true;
    
    Response response= await post(Uri.parse(registerUrl),body: {
    "first_name":"ahmed",
    "last_name":"elshora",
    "email":email,
    "password":password,
    "age":"28",
    "gender":"male",
     "name":name,
    });

    dynamic json=jsonDecode(response.body);
    if(response.statusCode==200){
      registerResponseModel=RegisterResponse.fromJson(json);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBars(token: registerResponseModel!.data!.accessToken,)));
    }else{
      print(json["message"]);
    }
    isLoading=false;
    
  }
}
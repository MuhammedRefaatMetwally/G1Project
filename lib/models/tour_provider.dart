
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/disland_screen.dart';
import 'package:newproject/models/tour_response.dart';

import '../main_screens/tour_screen.dart';

class TourProvider extends ChangeNotifier{
  double rating = 0;
  String? token;
  TourResponse? tourResponseModel;
  bool isLoading=false;
  void changeRating(double value){
    this.rating=value;
    notifyListeners();
  }
  void updateToken(String value){
    token=value;
    getPlaces();
  }
  
  Future getPlaces() async{
      isLoading=true;
    Response response= await get(Uri.parse(placesUrl),headers:{
      "Authorization":"Bearer $token"
    });
    dynamic json=jsonDecode(response.body);
    if(response.statusCode==200){
      tourResponseModel=TourResponse.fromJson(json);
    }else{
      print(json["message"]);
    }

    isLoading=false;
      notifyListeners();
  }
}
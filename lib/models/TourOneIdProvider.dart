import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:newproject/constans/strings.dart';

import 'TourOneIdResponse.dart';

class TourOneIdProvider extends ChangeNotifier{
  String? token;
  int? id;
  TourOneIdResponse? tourOneIdResponseModel;

  int selected = 50;
  int itemCount = 3;
  late FixedExtentScrollController _scrollController=FixedExtentScrollController();

  List places=[
    "assets/ff.png",
    "assets/IMG 02.png",
    "assets/ff1.png",
  ];
  void updateToken(String value){
    token=value;
    getPlaces1();
  }
  void changeSelected(int value){
    selected=value;
    notifyListeners();
  }
  Future getPlaces1() async{

    Response response= await get(Uri.parse(places1Url),headers:
    {
      "Authorization":"Bearer ${token}"
    });
    dynamic json=jsonDecode(response.body);
    if(response.statusCode==200  ){
      TourOneIdResponse tourResponseModel=TourOneIdResponse.fromJson(json);
    }else{
      print(json["message"]);
    }

    print(response.body);

      notifyListeners();
  }

}
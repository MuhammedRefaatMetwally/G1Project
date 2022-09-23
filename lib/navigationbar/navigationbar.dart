import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/disland_screen.dart';
import 'package:newproject/main_screens/drawer.dart';
import 'package:newproject/main_screens/favourite_screen.dart';
import 'package:newproject/main_screens/my_trip.dart';
import 'package:newproject/models/login_response.dart';
import 'package:newproject/models/tour_provider.dart';
import 'package:newproject/models/tour_response.dart';

import '../main_screens/location_sceen.dart';
import '../main_screens/profile_screen.dart';
import '../main_screens/tour_screen.dart';
class NavigationBars extends StatefulWidget {
  String? token;

   NavigationBars({Key? key,this.token}) : super(key: key);


  @override
  State<NavigationBars> createState() => _NavigationBarState();

}
 int _currentIndex=2;

class _NavigationBarState extends State<NavigationBars> with SingleTickerProviderStateMixin{
final controller=PageController(initialPage: _currentIndex);

  @override
  void initState() {
    super.initState();
  }


  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
      controller.animateToPage(_currentIndex, duration: Duration(seconds: 1), curve: Curves.bounceIn);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scoffPageView(),
        bottomNavigationBar:scoffBottomNavigation()
    );
  }

  Widget scoffBottomNavigation(){
    return ConvexAppBar.badge(
      {1:'5'},
      badgeColor: Colors.redAccent,
      items: [
        TabItem(
            icon: ImageIcon(
              AssetImage(navIcon1),
              color: _currentIndex == 0 ? MyColors.myWhite : MyColors.myBlack,
            )),
        TabItem(
            icon: ImageIcon(
              AssetImage(navIcon2),
              color: _currentIndex == 1 ? MyColors.myWhite : MyColors.myBlack,
            )),
        TabItem(
            icon: ImageIcon(
              AssetImage(navIcon3),
              color: _currentIndex == 2 ? MyColors.myWhite : MyColors.myBlack,
            )),
        TabItem(
            icon: ImageIcon(
              AssetImage(navIcon4),
              color: _currentIndex == 3 ? MyColors.myWhite : MyColors.myBlack,
            )),
        TabItem(
            icon: ImageIcon(
              AssetImage(navIcon5),
              color: _currentIndex == 4 ? MyColors.myWhite : MyColors.myBlack,
            )),

      ],
      initialActiveIndex: _currentIndex,
      onTap: _changeItem,
      backgroundColor: MyColors.myWhite,
      activeColor: MyColors.myBlue,
    );
  }

 Widget scoffPageView(){
    return  PageView(
      physics: ClampingScrollPhysics(),
      controller: controller,
      children: [
        TourScreen(token: widget.token,),
        FavouriteScreen(),
        LocationScreen(),
        MyTrip(),
        ProfileScreen(),
        DisLandScreen(token: widget.token,),
      ],
    );
 }

  }


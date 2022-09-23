import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/drawer.dart';
import 'package:newproject/main_screens/tour_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List? images = [
    "assets/Location1.png",
    "assets/Location2.png",
    "assets/Location3.png",
    "assets/Location4.png",
    "assets/Location5.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: locaBody(),
    );
  }

  Widget locaBody() {
    return Theme(
      data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.black),
        trackBorderColor: MaterialStateProperty.all(Colors.black38),
        trackColor: MaterialStateProperty.all(Colors.black12),
      )),
      child: locaUI(),
    );
  }

  Widget locaUI() {
    return Scrollbar(
      isAlwaysShown: true,
      hoverThickness: 20,
      showTrackOnHover: true,
      child: locaStructure(),
    );
  }

  Widget locaStructure() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        someSpace(30.h),
        locaAppBar(),
        locaListItems(),
        someSpace(15.h),
      ],
    );
  }

  Widget locaListItems() {
    return Expanded(
      child: ListView.builder(
          itemCount: images!.length,
          itemBuilder: (context, index) {
            var item = images![index];
            return Card(
              elevation: 0,
              child: Container(child: Image.asset(item)),
            );
          }),
    );
  }

  Widget locaAppBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        locaSideMenu(),
        locaTitle(),
      ],
    );
  }

  Widget locaSideMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NavigationDrawer()));
          },
          icon: ImageIcon(AssetImage(sideMenuIcon))),
    );
  }

  Widget locaTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 70.0),
      child: Center(
        child: Text(
          locTitle,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

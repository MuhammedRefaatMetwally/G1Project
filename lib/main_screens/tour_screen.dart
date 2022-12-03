import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/disland_screen.dart';
import 'package:newproject/main_screens/drawer.dart';
import 'package:newproject/models/tour_provider.dart';
import 'package:newproject/models/tour_response.dart';
import 'package:provider/provider.dart';

import '../models/login_provider.dart';

class TourScreen extends StatelessWidget {
  String? token;

  TourScreen({Key? key, this.token}) : super(key: key);
  List places = ["Paris", "India", "New York", "Los Angeles"];

  List images = [
    "assets/11.png",
    "assets/22.png",
    "assets/33.png",
    "assets/44.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: tourBody(context),
    );
  }

  Widget tourBody(BuildContext context) {

    return Theme(
        data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.black),
          trackBorderColor: MaterialStateProperty.all(Colors.black38),
          trackColor: MaterialStateProperty.all(Colors.black12),
        )),
        child: tourUI(context));
  }

  Widget tourUI(BuildContext context) {
    return Scrollbar(
      showTrackOnHover: true,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        child: tourStructure(context),
      ),
    );
  }

  Widget tourStructure(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        someHeightSpace(30.h),
        tourAppBar(context),
        someHeightSpace(10.h),
        tourDestnationTile(),
        tourDestnationListItems(),
        someHeightSpace(20.h),
        tourStackedMiddelView(),
        tourDiscoverNePlacesTxt(),
        tourConsumerListitems(context),
      ],
    );
  }
 Widget tourConsumerListitems(BuildContext context){
   TourProvider tourProvider =
   Provider.of<TourProvider>(context, listen: false);
   tourProvider.updateToken(token ?? "");
    return tourDiscoverListOfItems(context);
 }

 Widget tourDiscoverListOfItems(var item){
    return SizedBox(
      height: 275.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          child: Consumer<TourProvider>(
            builder: (_, provider, __) => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Datum? item = provider.tourResponseModel?.data!.data![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          tourDiscoverCardGradientImg(item,context),
                          tourDiscoverCardName(item),
                        ],
                      ),
                      tourDiscoverCardDetails(item,context),
                    ],
                  );
                },
                separatorBuilder: (context, int index) {
                  return someWidthtSpace(20.w);
                },
                itemCount: 3),
          ),
        ),
      ),
    );
 }
 Widget tourDiscoverCardGradientImg(var item, BuildContext context){
    return  GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DisLandScreen(
                  id: item?.id,
                  token: token,
                )));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: GestureDetector(
          child: Container(
            width: 130.w,
            height: 180.h,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFF2485EC)
                  ],
                ).createShader(Rect.fromLTRB(
                    0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.color,
              child: GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    images[1],
                    fit: BoxFit.fill,
                  )),
            ),
          ),
        ),
      ),
    );

 }
 Widget tourDiscoverCardName(var item){
    return Text("   ${item?.name}\n",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
          color: MyColors.myWhite,
        ));
 }

 Widget tourDiscoverCardDetails(var item,BuildContext context){
    return Container(
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            tourDiscoverRatingBar(context),
            tourDiscoverRating(context),
            tourDiscoverDiscreption(item),
          ],
        ));
 }
 Widget tourDiscoverRatingBar(BuildContext context){
   TourProvider tourProvider =
   Provider.of<TourProvider>(context, listen: false);
   tourProvider.updateToken(token ?? "");
    return RatingBar.builder(
      minRating: 1,
      updateOnDrag: true,
      itemSize: 15,
      allowHalfRating: true,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: MyColors.myAmber,
        size: 10,
      ),
      onRatingUpdate: (rating) {
        tourProvider.changeRating(rating);
      },
    );
 }
 Widget tourDiscoverRating(BuildContext context){
   TourProvider tourProvider =
   Provider.of<TourProvider>(context, listen: false);
   tourProvider.updateToken(token ?? "");
    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: Text(
        "    Rating:${tourProvider.rating}",
        style: TextStyle(
            fontSize: 12.sp,
            color: MyColors.myBlue),
      ),
    );
 }
  Widget tourDiscoverDiscreption(var item){
    return  Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        "    ${item?.description}",
        style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black54),
      ),
    );
  }
  Widget tourStackedMiddelView() {
    return Stack(children: [
      tourStackedImage(),
      tourStackedListItems(),
      tourTxtOnMainImage(),
    ]);
  }
  Widget tourStackedListItems(){
    return  Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Expanded(
            child: Container(
              width: double.infinity,
              height: 118.h,
              child: ListView.separated(
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return tourStackedCardMiddleView();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return someWidthtSpace(30.w);

                },
              ),
            ),
          ),
        ));
  }
   Widget tourTxtOnMainImage(){
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 50,
      ),
      child: Container(
        child: RichText(
          text: TextSpan(
              text: txtOnImage3,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              children: [
                TextSpan(
                    text: txtOnImage4, style: TextStyle(fontSize: 12.sp)),
                TextSpan(
                    text: txtOnImage5,
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: txtOnImage6, style: TextStyle(fontSize: 12.sp)),
              ]),
        ),
      ),
    );
   }
  Widget tourStackedCardMiddleView(){
    return Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tourStackedCardLeading(),
            someHeightSpace(10.h),
            tourStackedCardTxt(),
          ],
        ));
  }
  Widget tourStackedCardTxt(){
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: RichText(
            text: TextSpan(text: "", children: [
              TextSpan(
                  text: txtOnImage,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myBlack)),
              TextSpan(
                  text: txtOnImage1,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myBlack)),
              TextSpan(
                  text: txtOnImage2,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: MyColors.myGrey)),
              WidgetSpan(
                  child: Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5.sp),
                              spreadRadius: 4,
                              blurRadius: 7,
                            )
                          ],
                          color: MyColors.myBlue,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: MyColors.myWhite,
                        size: 20.sp,
                      ))),
            ])),
      ),
    );
  }
  Widget tourStackedCardLeading(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 3,
                height: 15,
                color: MyColors.myBlue,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                holidayTxt,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: MyColors.myGrey),
              )),
        ),
      ],
    );
  }
  Widget tourStackedImage(){
    return Container(
        width: double.infinity,
        child: Image.asset(
          tourImage,
          fit: BoxFit.cover,
        ));
  }
Widget tourDiscoverNePlacesTxt(){
    return  Padding(
      padding: const EdgeInsets.only(left: 25, top: 16),
      child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Text(
              discoNewPlaces,
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.myBlue),
            ),
          )),
    );
}
  Widget tourDestnationListItems() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 100.h,
        width: 393.w,
        child: tourDestnationItems(),
      ),
    );
  }

  Widget tourDestnationItems(){
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          var item = images[index];
          var place = places[index];
          return  tourDestnationItem(item,place);
        },
        separatorBuilder: (BuildContext context, int index) {
          return someWidthtSpace(20.w);
        },
      ),
    );
  }

  Widget tourDestnationItem(var item,var place){
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: tourDestnationCardDetails(item,place),
    );
  }
  Widget tourDestnationCardDetails(var item,var place){
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        tourDestnationCardImage(item),
        someHeightSpace(10),
        tourDestnationCardTxt(place),
      ],
    );
  }
  Widget tourDestnationCardImage(var item){
    return Ink.image(
      image: AssetImage(
        item,
      ),
      child: InkWell(
        onTap: () {},
      ),
      height: 60.h,
      width: 115.w,
      fit: BoxFit.fill,
    );
  }
  Widget tourDestnationCardTxt(var place){
    return Text(
      "${place}                ",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Color(0xff111111)),
    );
  }
  Widget tourDestnationTile() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          tourDestnationTxt(),
          tourDestnationAvaliability(),
        ],
      ),
    );
  }

  Widget tourDestnationAvaliability() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          avaliableTime,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: MyColors.myGrey),
        ),
      ),
    );
  }

  Widget tourDestnationTxt() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          popularDesTxt,
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.myBlue),
        ),
      ),
    );
  }

  Widget tourAppBar(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          tourSideMenu(context),
          tourTitle(),
        ]);
  }

  Widget tourTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 88.0),
      child: Center(
        child: Text(
          toursText,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget tourSideMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NavigationDrawer()));
          },
          icon: ImageIcon(AssetImage(sideMenuIcon))),
    );
  }

  Widget someHeightSpace(double value) {
    return SizedBox(
      height: value,
    );
  }

  Widget someWidthtSpace(double value) {
    return SizedBox(
      width: value,
    );
  }
}

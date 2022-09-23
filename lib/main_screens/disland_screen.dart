import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/models/TourOneIdProvider.dart';
import 'package:newproject/models/TourOneIdResponse.dart';
import 'package:provider/provider.dart';

class DisLandScreen extends StatelessWidget {
  int? id;
  String? token;

  DisLandScreen({Key? key, this.id, this.token}) : super(key: key);

  late FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: dislandBody(context),
    );
  }

  Widget dislandBody(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.black),
        trackBorderColor: MaterialStateProperty.all(Colors.black38),
        trackColor: MaterialStateProperty.all(Colors.black12),
      )),
      child: disLandUI(context),
    );
  }

  Widget disLandUI(BuildContext context) {
    TourOneIdProvider tourOneIdProvider =
        Provider.of<TourOneIdProvider>(context, listen: false);
    tourOneIdProvider.updateToken(token ?? "");
    Data? item = tourOneIdProvider.tourOneIdResponseModel?.data;
    return Scrollbar(
      showTrackOnHover: true,
      isAlwaysShown: true,
      child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        someSpace(45.h),
        dislandappBar(context),
        someSpace(10.h),
        disLandStackWidgets(context),
        disLandTitle(context),
        someSpace(25.h),
        disLandDialog(context),
      ])),
    );
  }

  Widget disLandDialog(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          disLandDepature(),
          someSpace(20.h),
          disLandDurationTxt(),
          someSpace(20.h),
          disLandFanTxt(),
          disLandTxtInfo(),
        ]),
      ),
    );
  }

  Widget disLandDepature() {
    return RichText(
      text: TextSpan(
        text: depature,
        style: GoogleFonts.lato().copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.myBlack),
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Text(date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget disLandDurationTxt() {
    return RichText(
      text: TextSpan(
        text: duration,
        style: TextStyle(
            fontSize: 15.sp,
            color: Color(0xff111111),
            fontWeight: FontWeight.bold),
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Text(fivedays,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget disLandFanTxt() {
    return RichText(
      text: TextSpan(
        text: disneyText,
        style: TextStyle(
            fontSize: 15.sp,
            color: Color(0xff111111),
            fontWeight: FontWeight.bold),
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 8.0),
              child: Container(
                child: Text(fansText,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget disLandTxtInfo() {
    return Text(disneyInfo,
        style: TextStyle(fontSize: 15.sp, color: Colors.grey));
  }

  Widget disLandTitle(BuildContext context) {
    TourOneIdProvider tourOneIdProvider =
        Provider.of<TourOneIdProvider>(context, listen: false);
    tourOneIdProvider.updateToken(token ?? "");
    Data? item = tourOneIdProvider.tourOneIdResponseModel?.data;
    return Center(
      child: Text("${item?.longitude}",
          style: GoogleFonts.lato()
              .copyWith(fontSize: 26.sp, fontWeight: FontWeight.bold)),
    );
  }

  Widget dislandappBar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Icon(
            Icons.navigate_before,
            size: 35.sp,
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            back,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Center(
            child: Text(
              paris,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120.0),
          child: Icon(Icons.search),
        ),
      ],
    );
  }

  Widget disLandStackWidgets(BuildContext context) {
    TourOneIdProvider tourOneIdProvider =
        Provider.of<TourOneIdProvider>(context, listen: false);
    tourOneIdProvider.updateToken(token ?? "");
    Data? item = tourOneIdProvider.tourOneIdResponseModel?.data;
    return Stack(children: [
      disLandMainImage(),
      horizListWheelView(context),
      disLandTxtOnPic(),
    ]);
  }

  Widget horizListWheelView(BuildContext context) {
    TourOneIdProvider tourOneIdProvider =
        Provider.of<TourOneIdProvider>(context, listen: false);
    tourOneIdProvider.updateToken(token ?? "");
    Data? item = tourOneIdProvider.tourOneIdResponseModel?.data;
    return Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Expanded(
            child: Container(
              width: double.infinity,
              height: 200.h,
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView(
                    controller: _scrollController,
                    onSelectedItemChanged: (x) {
                      tourOneIdProvider.changeSelected(x);
                    },
                    physics: FixedExtentScrollPhysics(),
                    itemExtent: 190,
                    diameterRatio: 20,
                    squeeze: 1,
                    perspective: .001,
                    useMagnifier: true,
                    magnification: 1.2,
                    offAxisFraction: -.3,
                    children: List.generate(
                        tourOneIdProvider.places.length,
                        (x) => RotatedBox(
                              quarterTurns: 1,
                              child: AnimatedContainer(
                                height: x == tourOneIdProvider.selected
                                    ? 180.h
                                    : 130.h,
                                alignment: Alignment.center,
                                width: x == tourOneIdProvider ? 250.w : 150.w,
                                duration: Duration(milliseconds: 2),
                                child: Image.asset(tourOneIdProvider.places[x]),
                              ),
                            ))),
              ),
            ),
          ),
        ));
  }

  Widget disLandMainImage() {
    return Container(
        width: double.infinity,
        height: 250,
        child: Image.asset(
          parisPic,
          fit: BoxFit.cover,
        ));
  }

  Widget disLandTxtOnPic() {
    return Container(
      child: RichText(
        text: TextSpan(text: "", children: [
          WidgetSpan(
              child: Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Center(
              child: Container(
                child: Text(
                  topTenText,
                  style: TextStyle(fontSize: 27.sp, color: Colors.white),
                ),
              ),
            ),
          )),
          WidgetSpan(
              child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Container(
                child: Text(
                  desParis,
                  style: TextStyle(fontSize: 27.sp, color: Colors.white),
                ),
              ),
            ),
          ))
        ]),
      ),
    );
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

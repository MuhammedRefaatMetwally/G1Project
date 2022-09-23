import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/drawer.dart';

import '../constans/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: pfBody(context),
    );
  }

  Widget pfBody(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.black),
          trackBorderColor: MaterialStateProperty.all(Colors.black38),
          trackColor: MaterialStateProperty.all(Colors.black12),
        )),
        child: pfUI(context));
  }

  Widget pfUI(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      hoverThickness: 10,
      showTrackOnHover: true,
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              someSpace(50.h),
              pfAppBar(context),
              pfStackedPictures(),
              pfDetails(),
            ]),
      ),
    );
  }

  Widget pfAppBar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        pfSideMenu(context),
        pfAppBarTitile(),
        pfEditBtn(),
      ],
    );
  }

  Widget pfEditBtn() {
    return Padding(
      padding: const EdgeInsets.only(left: 105),
      child: GestureDetector(
          onTap: () {},
          child: Text(
            editTxt,
            style: TextStyle(fontSize: 16.sp, color: Color(0xff4458DB)),
          )),
    );
  }

  Widget pfAppBarTitile() {
    return Padding(
      padding: const EdgeInsets.only(left: 90.0),
      child: Center(
        child: Text(
          pfTitle,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget pfSideMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NavigationDrawer()));
          },
          icon: ImageIcon(AssetImage(sideMenuIcon))),
    );
  }

  Widget pfStackedPictures() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          profileImage(),
          pfCameraIcon(),
        ],
      ),
    );
  }

  Widget pfCameraIcon() {
    return Container(
      width: 32.w,
      height: 32.h,
      margin: EdgeInsets.only(
        top: 30,
        bottom: 60,
        right: 120,
      ),
      decoration: BoxDecoration(
        color: MyColors.myBlue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          Icons.camera_alt,
          color: MyColors.myWhite,
          size: 22,
        ),
      ),
    );
  }

  Widget profileImage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(113, 25, 112, 25),
      child: Image.asset(
        pfImage,
        height: 150.h,
        width: 150.w,
      ),
    );
  }

  Widget pfDetails() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pfEmail(),
          profilePhone(),
          profileGender(),
          pfDateOfBirth(),
          pfAddress(),
          someSpace(30.h),
        ],
      ),
    );
  }

  Widget pfEmail() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0),
      child: Container(
          color: MyColors.myWhite,
          child: RichText(
            text: TextSpan(
                text: pfEmailTxt,
                style: TextStyle(fontSize: 12.sp, color: MyColors.myGrey),
                children: [
                  TextSpan(
                      text: pfEmail2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myBlack,
                      )),
                  WidgetSpan(
                      child: Divider(
                    thickness: 1.sp,
                    endIndent: 30.sp,
                  )),
                ]),
          )),
    );
  }

  Widget profilePhone() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, top: 30),
      child: Container(
          color: MyColors.myWhite,
          child: RichText(
            text: TextSpan(
                text: pfPhone,
                style: TextStyle(fontSize: 12.sp, color: MyColors.myGrey),
                children: [
                  TextSpan(
                      text: pfNum,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myBlack,
                      )),
                  WidgetSpan(
                      child: Divider(
                    thickness: 1.sp,
                    endIndent: 30.sp,
                  )),
                ]),
          )),
    );
  }

  Widget profileGender() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, top: 30),
      child: Container(
          color: MyColors.myWhite,
          child: RichText(
            text: TextSpan(
                text: pfGendertxt,
                style: TextStyle(fontSize: 12.sp, color: MyColors.myGrey),
                children: [
                  TextSpan(
                      text: pfGender,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myBlack,
                      )),
                  WidgetSpan(
                      child: Divider(
                    thickness: 1.sp,
                    endIndent: 30.sp,
                  )),
                ]),
          )),
    );
  }

  Widget pfDateOfBirth() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, top: 30),
      child: Container(
          color: MyColors.myWhite,
          child: RichText(
            text: TextSpan(
                text: pfDOBTxt,
                style: TextStyle(fontSize: 12.sp, color: MyColors.myGrey),
                children: [
                  TextSpan(
                      text: pfDOB,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myBlack,
                      )),
                  WidgetSpan(
                      child: Divider(
                    thickness: 1.sp,
                    endIndent: 30.sp,
                  )),
                ]),
          )),
    );
  }

  Widget pfAddress() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, top: 30),
      child: Container(
          color: MyColors.myWhite,
          child: RichText(
            text: TextSpan(
                text: pfAdressTxt,
                style: TextStyle(fontSize: 12.sp, color: MyColors.myGrey),
                children: [
                  TextSpan(
                      text: pfAdress,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myBlack,
                      )),
                  WidgetSpan(
                      child: Divider(
                    thickness: 1.sp,
                    endIndent: 30.sp,
                  )),
                ]),
          )),
    );
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

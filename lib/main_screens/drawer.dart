import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.myWhite,
      child: drawerBody(context),
    );
  }

  Widget drawerBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          someSpace(40.h),
          drawerUI(context),
        ],
      ),
    );
  }

  Widget drawerUI(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        xBackBtn(context),
        drawerPfPic(),
        drawerPfName(),
        drawerPfEmail(),
        someSpace(40.h),
        notifiMenu(),
      ],
    ));
  }

  Widget drawerPfEmail() {
    return Text(
      pfEmail,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18.sp, color: MyColors.myGrey),
    );
  }

  Widget drawerPfName() {
    return Text(
      pfName,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
    );
  }

  Widget drawerPfPic() {
    return Container(
      height: 165,
      width: 200,
      child: FittedBox(
        child: Image.asset(
          pfPicture,
          width: 150.w,
          height: 110.h,
        ),
      ),
    );
  }

  Widget xBackBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Icon(
            Icons.clear,
            size: 35.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget notifiMenu() {
    return Wrap(
      runSpacing: 2.h,
      children: [
        drawerNotifi(),
        drawerTours(),
        drawerLocations(),
        drawerLanguage(),
        drawerInviFriends(),
        drawerDivider(),
        drawerHelp(),
        drawerSettings(),
        drawerLogOut(),
      ],
    );
  }

  Widget drawerNotifi() {
    return ListTile(
      title: RichText(
        text: TextSpan(
            text: pfNotifi,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: MyColors.myBlack),
            children: [
              TextSpan(
                  text: notifiNum,
                  style: TextStyle(
                      color: MyColors.myGrey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold))
            ]),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myRed),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Icon(
                FontAwesomeIcons.solidBell,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerTours() {
    return ListTile(
      title: Text(
        pfTour,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myLiBlue),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.plane,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerLocations() {
    return ListTile(
      title: Text(
        pfLocations,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myPink),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.locationDot,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerLanguage() {
    return ListTile(
      title: Text(
        pfLang,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myPurple),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.globe,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerInviFriends() {
    return ListTile(
      title: Text(
        pfInvi,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myBIcon),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.userGroup,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerDivider() {
    return Divider(
      color: MyColors.myDivider,
      indent: 25,
      endIndent: 25,
      thickness: 1,
    );
  }

  Widget drawerHelp() {
    return ListTile(
      title: Text(
        pfHelp,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myYellow),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.headphonesSimple,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerSettings() {
    return ListTile(
      title: Text(
        pfSetting,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myGreen),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.wrench,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget drawerLogOut() {
    return ListTile(
      title: Text(
        pfLogOut,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: Icon(FontAwesomeIcons.chevronRight),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: MyColors.myLiGrey),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                FontAwesomeIcons.doorOpen,
                color: MyColors.myWhite,
                size: 22,
              ),
            )),
      ),
    );
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

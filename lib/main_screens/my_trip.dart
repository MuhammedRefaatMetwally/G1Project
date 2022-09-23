import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/drawer.dart';
import 'package:newproject/tabs/second_tab.dart';

import '../error_screens/15_payment_faild.dart';
import '../error_screens/18_router_offline.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({Key? key}) : super(key: key);

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: tripBody(),
    );
  }

  Widget tripBody() {
    return Theme(
      data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.black),
        trackBorderColor: MaterialStateProperty.all(Colors.black38),
        trackColor: MaterialStateProperty.all(Colors.black12),
      )),
      child: tripUI(),
    );
  }

  Widget tripUI() {
    return Scrollbar(
      showTrackOnHover: true,
      isAlwaysShown: true,
      child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        someSpace(45.h),
        tripAppBar(),
        someSpace(10.h),
        tripTabs(),
        tripTabBarView(),
      ])),
    );
  }

  Widget tripTabBarView() {
    return SizedBox(
      height: 550.h,
      child: TabBarView(controller: _tabController, children: [
        RouterOfflineScreen(),
        SecondTab(),
        PaymentFaildScreen(),
      ]),
    );
  }

  Widget tripTabs() {
    return Container(height: 30, child: tripTabBar());
  }

  Widget tripTabBar() {
    return TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Color(0xff111111),
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 1,
        indicatorColor: Color(0xff2484EC),
        tabs: [
          tripFirstTab(),
          tripSecondTab(),
          tripThirdTab(),
        ]);
  }

  Widget tripSecondTab() {
    return Tab(
      child: Text(
        secondTab,
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }

  Widget tripThirdTab() {
    return Tab(
      child: Text(
        thirdTab,
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }

  Widget tripFirstTab() {
    return Tab(
      child: Text(
        firstTab,
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Widget tripAppBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [tripSideMenu(), tripTitle(), tripSearch()],
    );
  }

  Widget tripTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 95.0),
      child: Center(
        child: Text(
          myTripTitle,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget tripSearch() {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0),
      child: Icon(Icons.search),
    );
  }

  Widget tripSideMenu() {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NavigationDrawer()));
            },
            icon: ImageIcon(AssetImage(sideMenuIcon))));
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/main_screens/drawer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  double rating = 0;
  List? images = [
    "assets/aa.png",
    "assets/bb.png",
    "assets/cc.png",
    "assets/dd.png",
    "assets/ee.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: favBody(),
    );
  }

  Widget favBody() {
    return Theme(
        data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.black),
          trackBorderColor: MaterialStateProperty.all(Colors.black38),
          trackColor: MaterialStateProperty.all(Colors.black12),
        )),
        child: favUI());
  }

  Widget favUI() {
    return Scrollbar(
      isAlwaysShown: true,
      hoverThickness: 20,
      showTrackOnHover: true,
      child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        someSpace(45.h),
        favAppbar(),
        favListItems(),
      ])),
    );
  }

  Widget favAppbar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        favSideMenu(),
        favScreenTitle(),
        favSearch(),
      ],
    );
  }

  Widget favSearch() {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0),
      child: GestureDetector(onTap: () {}, child: Icon(Icons.search)),
    );
  }

  Widget favScreenTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 80.0),
      child: Center(
        child: Text(
          favTxt,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget favSideMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NavigationDrawer()));
          },
          icon: ImageIcon(AssetImage(sideMenuIcon))),
    );
  }

  Widget favListItems() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 560.h,
          width: double.infinity,
          child: ListView.separated(
            itemCount: 5,
            itemBuilder: (context, index) {
              var item = images![index];
              return Stack(
                children: [
                  firstFavStackedCard(),
                  secFavStackedCard(item),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return someSpace(0.h);
            },
          ),
        ),
      ],
    );
  }

  Widget secFavStackedCard(var item) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 35, bottom: 10),
      child: Positioned(
        child: favCards(item),
      ),
    );
  }

  Widget favCards(var item) {
    return Container(
      width: 330.w,
      height: 115.h,
      child: favMainCard(item),
    );
  }

  Widget favMainCard(var item) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          favCardImage(item),
          favCardStructure(),
        ],
      ),
    );
  }

  Widget favCardImage(var item) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20,
        bottom: 20,
      ),
      child: Container(
        height: 90.h,
        width: 80.w,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            item,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget favCardStructure() {
    return Container(
      width: 200.w,
      height: 110.h,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 14),
            child: Container(
              child: Row(
                children: [
                  favCardTitle(),
                  favCardHeart(),
                ],
              ),
            ),
          ),
          favCardDetails(),
        ],
      ),
    );
  }

  Widget favCardTitle() {
    return Text(
      gbrPlace,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
    );
  }

  Widget favCardDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 13.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            favCardinfo(),
            favRatingBar(),
          ],
        ),
      ),
    );
  }

  Widget favCardHeart() {
    return Padding(
      padding: const EdgeInsets.only(left: 44.0),
      child: Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: MyColors.myRed),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              FontAwesomeIcons.solidHeart,
              color: MyColors.myWhite,
              size: 15,
            ),
          )),
    );
  }

  Widget favCardinfo() {
    return Row(
      children: [
        favInfoIcon(),
        favInfoTxt(),
      ],
    );
  }

  Widget favInfoIcon() {
    return Icon(FontAwesomeIcons.locationDot,
        size: 12.sp, color: MyColors.myGrey);
  }

  Widget favInfoTxt() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        "Australia",
        style: TextStyle(fontSize: 12.sp, color: MyColors.myGrey),
      ),
    );
  }

  Widget favRatingBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: Container(
        child: RatingBar.builder(
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
            setState(() {
              this.rating = rating;
            });
          },
        ),
      ),
    );
  }

  Widget firstFavStackedCard() {
    return Positioned(
        left: 15,
        top: 1,
        bottom: 15,
        child: Container(
          width: 320.w,
          height: 130.h,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ));
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

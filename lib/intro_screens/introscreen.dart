import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/intro_screens/enjoy_trip.dart';
import 'package:newproject/intro_screens/plan_your_trip.dart';
import 'package:newproject/intro_screens/select_the_date.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TripScreen extends StatefulWidget {
  TripScreen({Key? key}) : super(key: key);

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final _controller = PageController();

  var currentindex = 0;

  bool isVisble = true;

  Future<bool> initializeController() {
    Completer<bool> completer = new Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });
    return completer.future;
  }

  // /initializeController()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: intrScreen(),
    );
  }

  Widget intrScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 650,
          child: smthPageIndactorPageView(),
        ),
        smoothPageIndactorDataCheck(),
      ],
    );
  }

  Widget smthPageIndactorPageView() {
    return PageView(
      controller: _controller,
      onPageChanged: (page) {
        if (page == 0 || page == 2) {
          setState(() {
            isVisble = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThirdPage()));
        }
      },
      children: [
        FirstPage(),
        SecondPage(),
        ThirdPage(),
      ],
    );
  }

  Widget smoothPageIndactorDataCheck() {
    return FutureBuilder(
        future: initializeController(),
        builder: (BuildContext context, AsyncSnapshot<void> snap) {
          if (!snap.hasData) {
            // Just return a placeholder widget, here it's nothing but you have to return something to avoid errors
            return SizedBox();
          }
          return Column(children: [
            Visibility(
              visible: isVisble,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  skipBtn(),
                  smthPageIndactorWidget(),
                  nxtBtn(),
                ],
              ),
            )
          ]);
        });
  }

  Widget skipBtn() {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThirdPage()));
        },
        child: Text(
          skip,
          style: TextStyle(fontSize: 12, color: MyColors.myGrey),
        ));
  }

  Widget nxtBtn() {
    return TextButton(
        onPressed: () {
          _controller.nextPage(
              duration: Duration(milliseconds: 2), curve: Curves.bounceInOut);
          if (_controller.page == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ThirdPage()));
          }
        },
        child: Text(
          nxt,
          style: TextStyle(fontSize: 12, color: MyColors.myBlue),
        ));
  }

  Widget smthPageIndactorWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SmoothPageIndicator(
        controller: _controller,
        count: 3,
        onDotClicked: (index) {
          currentindex = index;
          if (currentindex == 1) {
            _controller.nextPage(
                duration: Duration(milliseconds: 2), curve: Curves.bounceIn);
          } else if (currentindex == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ThirdPage()));
          }
        },
        effect: JumpingDotEffect(
            activeDotColor: MyColors.myBlue,
            dotColor: MyColors.myGrey,
            dotHeight: 12,
            dotWidth: 12,
            spacing: 16,
            verticalOffset: 20),
      ),
    );
  }
}

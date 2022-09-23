import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void startTimer(){
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  splashUI(),
    );
  }

  Widget splashUI(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        splashStackedPic()
      ],
    );
  }

  Widget splashStackedPic(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: 690.h,
            width: double.infinity,
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.cover,
            )),
        Container(child: Image.asset("assets/splashimage.png",height: 200.h,width: 200.w,),)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = PageController();
    return Scaffold(
      body: planTripBody(),
    );
  }

  Widget planTripBody() {
    return Container(
      height: double.infinity,
      child: planTripUI(),
    );
  }

  Widget planTripUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        someSpace(50.h),
        planTriplogo(),
        someSpace(20.h),
        planTriPicture(),
        planTripTxt(),
        planTripDialog(),
      ],
    );
  }

  Widget planTripDialog() {
    return RichText(
        text: TextSpan(text: "\n", children: [
      TextSpan(
          text: plandialog,
          style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
      TextSpan(
          text: plandialog2,
          style: TextStyle(color: Colors.grey, fontSize: 12.sp))
    ]));
  }

  Widget planTripTxt() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Text(
          planText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
    );
  }

  Widget planTriPicture() {
    return Center(
        child: Image.asset(
      splitScPic,
      fit: BoxFit.cover,
    ));
  }

  Widget planTriplogo() {
    return Center(
        child: Image.asset(
      logoPic,
      width: 151.32.w,
      height: 64.14.h,
    ));
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/strings.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = PageController();
    return Scaffold(
      body: selectDateBody(),
    );
  }

  Widget selectDateBody() {
    return Container(
      height: double.infinity,
      child: selectDataUI(),
    );
  }

  Widget selectDataUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        someSpace(50.h),
        selectDateLogo(),
        someSpace(20.h),
        selectDataPicture(),
        selectDataTxt(),
        selectDataDialog(),
      ],
    );
  }

  Widget selectDataDialog() {
    return RichText(
        text: TextSpan(text: "\n", children: [
      TextSpan(
          text: selectDateDialog,
          style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
    ]));
  }

  Widget selectDataTxt() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Text(
          selectDateTxt,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
    );
  }

  Widget selectDataPicture() {
    return Center(
        child: Image.asset(
      splitScPic2,
      fit: BoxFit.cover,
    ));
  }

  Widget selectDateLogo() {
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

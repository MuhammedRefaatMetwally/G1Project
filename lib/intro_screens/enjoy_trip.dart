import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';
import 'package:newproject/sing_up_screens/signup.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = PageController();
    return Scaffold(
      body: enjTripBody(context),
    );
  }

  Widget enjTripBody(BuildContext context) {
    return Container(
      height: double.infinity,
      child: enjTripUi(context),
    );
  }

  Widget enjTripUi(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        someSpace(90.h),
        enjTripLogo(),
        someSpace(30.h),
        enjTriPic(),
        enjTripTxt(),
        enjTripDialog(),
        someSpace(22.h),
        lesGoBtn(context),
      ],
    );
  }

  Widget enjTriPic() {
    return Center(
        child: Image.asset(
      splitScPic3,
      fit: BoxFit.cover,
    ));
  }

  Widget enjTripLogo() {
    return Center(
        child: Image.asset(
      logoPic,
      width: 151.32,
      height: 64.14,
    ));
  }

  Widget enjTripTxt() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Text(
          enjoyText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }

  Widget enjTripDialog() {
    return RichText(
        text: TextSpan(text: "\n", children: [
      TextSpan(
          text: enjoydialog,
          style: TextStyle(color: MyColors.myGrey, fontSize: 12)),
    ]));
  }

  Widget lesGoBtn(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text(
              letsGo,
              style: TextStyle(fontSize: 12, color: MyColors.myBlue),
            ),
          ),
        ),
      ),
    );
  }

  Widget someSpace(double value) {
    return SizedBox(
      height: value,
    );
  }
}

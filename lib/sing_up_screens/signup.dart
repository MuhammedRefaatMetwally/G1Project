import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:newproject/main_screens/location_sceen.dart';
import 'package:newproject/models/login_provider.dart';
import 'package:newproject/models/login_response.dart';
import 'package:newproject/navigationbar/navigationbar.dart';
import 'package:newproject/sing_up_screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../constans/colors.dart';
import '../googleapi/googleapi.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: signUpWidget(context));
  }

  Widget signUpWidget(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff4458DB),
                Color(0xffB444DB),
              ]),
        ),
        child: signInStructure(context));
  }

  Widget signInStructure(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          someSpace(35.h),

          someSpace(10.h),
          Container(
              height: 480.h,
              width: double.infinity,
              child: stackWidget(context)),
          socialMediaIcons(),
          noAccoutBtn(context),
        ],
      ),
    );
  }
 Widget logoWidget(){
    return Image.asset(
      "assets/logo_white.png",
      alignment: Alignment.topCenter,
      width: 154.32.w,
      height: 64.14.h,
    );
 }
  Widget stackWidget(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        firstStackedContainer(),
        secondStackedContainer(),
        formThirdStackedContainer(context),
      ],
    );
  }
  Widget firstStackedContainer(){
    return Positioned(
      top: 31,
      child: Container(
        width: 272.58.w,
        height: 315.67.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0.sp),
          color: const Color(0xffFFFFFF).withOpacity(.2.sp),
        ),
      ),
    );
  }
  Widget secondStackedContainer(){
    return Positioned(
      top: 45,
      child: Container(
        width: 301.88.w,
        height: 300.67.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0.sp),
          color: const Color(0xffFFFFFF).withOpacity(.2.sp),
        ),
      ),
    );
  }
  Widget formThirdStackedContainer(BuildContext context){
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Positioned(
      top: 60,
      child: AnimatedContainer(
        width: 335.w,
        height: loginProvider.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0.sp),
          color: const Color(0xffFFFFFF),
        ),
        duration: Duration(milliseconds: 2),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              someSpace(50.h),
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
              ),
              someSpace(10.h),
              emailTxtField(context),
              someSpace(10.h),
              passTxtField(context),
              forgetPass(),
              signBtn(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget emailTxtField(BuildContext context){
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30.5, right: 30.5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(fontSize: 12.sp)),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !value.contains("@")) {
            loginProvider.animtedHeight(325.h);
            return "Email is not Valid";
          } else {
            loginProvider.normalHeight(300.h);
            return null;
          }
        },
        onSaved: (value) {
          loginProvider.email = value!;
        },
      ),
    );
  }
  Widget passTxtField(BuildContext context){
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30.5, right: 30.5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(fontSize: 12.sp)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            loginProvider.animtedHeight(325.h);

            return "Enter Valid Password";
          } else {
            loginProvider.animtedHeight(300.h);
            return null;
          }
        },
        onSaved: (value) {
          loginProvider.password = value!;
        },
        obscureText: loginProvider.isPassword,
      ),
    );
  }
  Widget forgetPass(){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(200, 10, 30, 32),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          "Forget Password?",
          style:
          TextStyle(fontSize: 12, color: Color(0xff4458DB)),
        ),
      ),
    );
  }
Widget signBtn(BuildContext context){
  LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return  Center(
        child: GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              loginProvider.login(context);
            }
          },
          child: Container(
              width: double.infinity,
              child: loginProvider.isLoading
                  ? showloadingindicator()
                  : Image.asset(
                "assets/button.png",
                width: 274.w,
                height: 60.h,
              )),
        ));
}
  Widget socialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: 60.w,
            height: 45.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)),
            child: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: 90.w,
            height: 45.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget noAccoutBtn(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Don’t have an account? Sign up",
              style: TextStyle(fontSize: 12.sp, color: Color(0xffFFFFFF)),
            )));
  }

  Widget showloadingindicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myPurple,
      ),
    );
  }
  Widget someSpace(double value){
    return SizedBox(
      height: value,
    );
  }

//   Future signIn()async{
// await GoogleSignInApi.login();
//   }
}

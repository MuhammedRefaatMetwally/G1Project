import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/models/register_provider.dart';
import 'package:newproject/navigationbar/navigationbar.dart';
import 'package:newproject/sing_up_screens/signup.dart';
import 'package:provider/provider.dart';

import '../constans/colors.dart';
import '../main_screens/location_sceen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: registerWidget(context)
    );
  }

  Widget registerWidget(BuildContext context){
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
      child: registerStructure(context)
    );
  }
  Widget registerStructure(BuildContext context){

    return SingleChildScrollView(
      child: registerUI(context)
    );
  }

  Widget registerUI(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        someSpace(35.h),
        registerLogo(),
        someSpace(10.h),
         registerStackedContainers(context),
          someSpace(10.h),
        haveAnAccountWidget(context),
      ],
    );
  }
  Widget registerLogo(){
    return Image.asset(
      "assets/logo_white.png",
      alignment: Alignment.topCenter,
      width: 154.32.w,
      height: 64.14.h,
    );
  }
  Widget registerStackedContainers(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Container(
      height: 520.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 15,
            child: Container(
              width: 262.58.w,
              height: 315.67.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0.sp),
                color: const Color(0xffFFFFFF).withOpacity(.2.sp),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Container(
              width: 290.w,
              height: 315.67.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0.sp),
                color: const Color(0xffFFFFFF).withOpacity(.2.sp),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: AnimatedContainer(
              width: 320.w,
              height: registerProvider.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0.sp),
                color: const Color(0xffFFFFFF),
              ),
              duration:Duration(milliseconds: 1),
              child: registerForm(context),
            ),
          ),
        ],
      ),
    );
  }
  Widget registerForm(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          someSpace(55.3.h),
          registerTitle(),
          someSpace(10.h),
          nameTxtField(context),
          someSpace(10.h),
          emailTxtField(context),
          someSpace(10.h),
          passwordTxtField(context),
          phoneNumTxtField(context),
          checkBox(context),
          registerBtn(context),
        ],
      ),
    );
  }
  Widget registerTitle(){
    return Center(
      child: Text(
        "Sign Up",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp),
      ),
    );
  }
  Widget nameTxtField(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.5, right: 30.5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Name",
            hintStyle: TextStyle(fontSize: 12.sp)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            registerProvider.animtedHeight(450.h);
            return "Please,Enter your name";
          } else {
            registerProvider.normalHeight(390.h);
            return null;
          }
        },
        onSaved: (value) {
          registerProvider.name = value!;
        },
      ),
    );
  }
  Widget emailTxtField(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.5, right: 30.5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(fontSize: 12.sp)),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !value.contains("@")) {
            registerProvider.animtedHeight(450.h);
            return "Email is not Valid";

          } else {
            registerProvider.animtedHeight(390.h);
            return null;
          }
        },
        onSaved: (value) {
          registerProvider.email = value!;
        },
      ),
    );
  }
  Widget passwordTxtField(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.5, right: 30.5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(

            hintText: "Password",
            hintStyle: TextStyle(fontSize: 12.sp)
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            registerProvider.animtedHeight(450.h);
            return "Enter Valid Password";
          } else {
            registerProvider.animtedHeight(390.h);
            return null;
          }
        },
        onSaved: (value) {
          registerProvider.password = value!;
        },
        obscureText: registerProvider.isPassword,
      ),
    );
  }
  Widget phoneNumTxtField(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.5, right: 30.5),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Phone Number (Optional)",
            hintStyle: TextStyle(fontSize: 12.sp)),
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          registerProvider.phone = value!;
        },
      ),
    );
  }
  Widget checkBox(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Transform.scale(
            scale: .6,
            child: Checkbox(
                activeColor: Color(0xff4458DB),
                value: registerProvider.isCheckedBox,
                onChanged: (value) {
                  registerProvider.isChecked(value!);
                }),
          ),
          RichText(
            text: TextSpan(
                text: "I agree the",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff111111)),
                children: [
                  TextSpan(
                      text: " Terms & Conditions",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff4458DB)))
                ]),
          ),
        ],
      ),
    );
  }
  Widget registerBtn(BuildContext context){
    RegisterProvider registerProvider=Provider.of<RegisterProvider>(context);
    return Center(
        child: GestureDetector(
          onTap: registerProvider.isCheckedBox?() {
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              registerProvider.Register(context);
            }
          }:null,
          child: registerProvider.isLoading?showloadingindicator():Container(
              width: double.infinity,
              child: Image.asset(
                "assets/signup.png",
                width: 274.w,
                height: 60.h,
              )),
        ));
  }
  Widget haveAnAccountWidget(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
      },
      child: Text(
        "Already have an account? Login",
        style: TextStyle(fontSize: 12.sp, color: Color(0xffFFFFFF)),
      ),
    );
  }
  Widget someSpace(double value){
    return SizedBox(
      height: value,
    );
  }
  Widget showloadingindicator(){
    return Center(child: CircularProgressIndicator(color: MyColors.myPurple,),);
  }
}

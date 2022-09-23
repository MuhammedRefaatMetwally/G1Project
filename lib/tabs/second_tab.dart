import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/constans/colors.dart';
import 'package:newproject/constans/strings.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: secondTabBody(),
    );
  }
  Widget secondTabBody(){
    return SizedBox(
      height: 520.h,
      child: secondTabItems()
    );
  }

  Widget secondTabItems(){
    return ListView.separated(itemCount: 3,itemBuilder: (context,index){
      return  listItems();
    }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h,); },);
  }

  Widget listItems(){
    return  containListOfItems();
  }
  Widget containListOfItems(){
    return Padding(
      padding: const EdgeInsets.only(top: 21.0, left: 21, right: 21),
      child: Container(
        width: 333.h,
        height: 180.h,
        color: MyColors.myWhite,
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              secTabCardTitle(),
              secTabCardDetails()
            ],
          ),
        ),
      ),
    );
  }

  Widget secTabCardTitle(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 15.0),
          child: Container(
            child: Text(
              paris,
              style: TextStyle(
                fontSize: 20.sp,
                color: MyColors.myBlack,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, top: 16),
          child: Container(
            child: Text(
              tab2Txt,
              style:
              TextStyle(fontSize: 16.sp, color: MyColors.myGrey),
            ),
          ),
        )
      ],
    );
  }

  Widget secTabCardDetails(){
    return Padding(
      padding: const EdgeInsets.only(top: 12.5, bottom: 18.5),
      child: Container(
        height: 110.h,
        width: 312.w,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            dividerWidget(),
            secondTabDetails(),
            dividerWidget(),
            chooseWidget(),
          ],
        ),
      ),
    );
  }

  Widget secondTabDetails(){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(tab2Image)),
          ),
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, bottom: 6),
                child: Container(
                    child: Text(
                      tab2Dialog,
                      style: TextStyle(fontSize: 15.sp),
                    )),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 15.0),
                child: Container(
                    child: Text(
                      tab2Dialog2,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dividerWidget(){
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Container(
        height: 10,
        child: Divider(
          thickness: 1,
          indent: 15,
          endIndent: 15,
        ),
      ),
    );
  }

  Widget chooseWidget(){
    return  Container(
      height: 19,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            tab2Book,
            style: TextStyle(
                fontSize: 15.sp,
                color: MyColors.myBlue),
          ),
          Container(
              height: 25,
              child: VerticalDivider(
                thickness: 1,
                width: 20,
              )),
          Text(
            tab2Help,
            style: TextStyle(
                fontSize: 15.sp,
                color: MyColors.myBlue),
          ),
        ],
      ),
    );
  }

}

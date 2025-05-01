import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_finalprojects/screens/home_screen.dart';
import 'reward_screen.dart';

class RedeemableRewards{
  late final int points;
  late final int pesos;


  RedeemableRewards({required this.points, required this.pesos});
}

List<RedeemableRewards> reedemableRewards = [
    RedeemableRewards( points: 1000, pesos: 100),
    RedeemableRewards( points: 500, pesos: 50),
    RedeemableRewards( points: 5000, pesos: 500),
    RedeemableRewards(points: 10000, pesos: 1000)
];



class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return goToRedeem? Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(onPressed: (){
        setState(() {
          goToRedeem = false;
        });
      }, icon: Icon(Icons.arrow_back), color:Colors.white, iconSize: 40,),
      body:  
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 800.h,
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 140.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      spacing: 20.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: Text("Your Balance", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40.sp),),
                        ),
                        Container(
                        height: 450.h,
                        width: 450.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: primaryColor, width: 3), shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(90.h),
                              child: Text("0\nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
              child: Text("REDEEMABLE REWARDS", style:TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 60.sp)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reedemableRewards.length - 1,
              itemBuilder:(context, index){ return Padding(
                padding:EdgeInsets.only(top: 50.h),
                child: Row(
                  spacing: 50.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 461.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Color.fromRGBO(187, 213, 191, 1), width: 3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        spacing: 10.h,
                        children: [
                          Transform.translate(
                            offset: Offset(0, -10),
                            child: Image.asset('assets/gcash_logo.png', height: 200.h,)),
                          Text("${reedemableRewards[index].pesos} Pesos", style: TextStyle(color: primaryColor, fontSize: 60.sp),),
                          Text("${reedemableRewards[index].points} Points", style: TextStyle(color: primaryColor, fontSize: 30.sp)),
                          TextButton(
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor)),
                            onPressed: (){}, 
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w),
                              child: Text("REDEEM", style: TextStyle(color: Colors.white),),
                
                            )),
                            
                        ],
                      ),
                    ),
                    Container(
                      width: 461.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Color.fromRGBO(187, 213, 191, 1), width: 3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        spacing: 10.h,
                        children: [
                          Transform.translate(
                            offset: Offset(0, -10),
                            child: Image.asset('assets/gcash_logo.png', height: 200.h,)),
                          Text("${reedemableRewards[index +1].pesos} Pesos", style: TextStyle(color: primaryColor, fontSize: 60.sp),),
                          Text("${reedemableRewards[index+1].pesos} Points", style: TextStyle(color: primaryColor, fontSize: 30.sp)),
                          TextButton(
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor)),
                            onPressed: (){}, 
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w),
                              child: Text("REDEEM", style: TextStyle(color: Colors.white),),
                
                            )),
                            
                        ],
                      ),
                    ),
                    
                  ],
                
                ),
              );
            }),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      )
      
    ):  RewardsScreen();
  }
}

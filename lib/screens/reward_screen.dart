import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  
  bool iSEarned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
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
                  Text("Rewards", style: TextStyle(fontSize: 80.sp)),
                  Column(
                    spacing: 20.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 20.w),
                        child: Text("Your Balance", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40.sp),),
                      ),
                      Stack(
                        children:[ 
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
                       
                        Positioned(
                          bottom: -5,
                          left:16,
                          child: TextButton(
                          onPressed: (){}, 
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(187, 213, 191, 1)),padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(80.w, 20.h, 80.w, 20.h))),
                          child: Text("REDEEM", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 50.sp),)),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 70.w, right: 70.w, top: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 50.w,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: iSEarned ? WidgetStatePropertyAll(Colors.transparent): WidgetStatePropertyAll(primaryColor),
                            side: WidgetStatePropertyAll(BorderSide(color: Colors.black45, width: 2)),
                            padding: WidgetStatePropertyAll(EdgeInsets.only(left: 50.w, right: 50.w)),
                            ),
                          onPressed: (){
                            setState(() {
                              iSEarned = false;
                            });
                          }, 
                          child: Text("Rewards", style: iSEarned? TextStyle(color: primaryColor):TextStyle(color: Colors.white),)),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: iSEarned ? WidgetStatePropertyAll(primaryColor): WidgetStatePropertyAll(Colors.transparent),
                            side: WidgetStatePropertyAll(BorderSide(color: Colors.black45, width: 2)),
                            padding: WidgetStatePropertyAll(EdgeInsets.only(left: 60.w, right: 60.w))),
                          onPressed: (){
                            setState(() {
                              iSEarned = true;
                            });
                          }, 
                          child: Text("Earned", style: iSEarned? TextStyle(color: Colors.white):TextStyle(color: primaryColor),))
                      ],
                    ),

                    Container(
                      child: iSEarned ? Earned() : Rewards(),
                    )

                    
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  
  
  final ScrollController _scrollController_r = ScrollController();

  void _scrollToEnd() {
    _scrollController_r.animateTo(
      _scrollController_r.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

   void _scrollToStart() {
    _scrollController_r.animateTo(
      _scrollController_r.position.minScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Daily Bonus", style: TextStyle(color:  Color.fromARGB(255, 64, 64, 64), fontSize: 50.sp)),
        SingleChildScrollView(
          controller: _scrollController_r,
          scrollDirection: Axis.horizontal,
          child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  IconButton(
                    onPressed: _scrollToEnd, 
                    icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 150.h,)),
                  Container( //Bonus 1
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(187, 213, 191, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                      ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20.h,
                        children: [
                          Text("10 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                          Text("Daily Login", style: TextStyle(color: primaryColor, fontSize: 40.sp)),
                          TextButton(
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                            onPressed: (){}, 
                            child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                              child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                            ) )
                        ],
                      ),
                    ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container( //Bonus 2
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,164, 173, 170),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                      ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.h,
                      children: [
                        Text("35 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                        Text("Complete \nTwo Challenges", style: TextStyle(color: primaryColor, fontSize: 30.sp), textAlign: TextAlign.center,),
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black54),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                            child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          ) )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container( //Bonus 3
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,164, 173, 170),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20.h,
                      children: [
                        Text("30 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                        Text("Deposit 10 Bottles", style: TextStyle(color: primaryColor, fontSize: 40.sp)),
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black54),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                            child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          ) )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,164, 173, 170),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.h,
                      children: [
                        Text("50 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                        Text("Receive Rewards\n Via App", style: TextStyle(color: primaryColor, fontSize: 30.sp), textAlign: TextAlign.center,),
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black54),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                            child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          ) )
                      ],
                    ),
                  ),
                      
                  IconButton(
                    onPressed: _scrollToStart, 
                    icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 150.h,textDirection: TextDirection.rtl,))
                ],
            ),
          ),
        ),
              SizedBox(
                height: 40.h,
              ),
              Text("Challenges", style: TextStyle(color:  Color.fromARGB(255, 64, 64, 64), fontSize: 50.sp)),
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                border: Border(left: BorderSide(color: Colors.blue.shade200, width:20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                    spreadRadius: 2,   // Extent of the shadow
                    blurRadius: 10,    // Softness of the shadow
                    offset: Offset(0, 6),
                    // Horizontal and vertical offset
                  ),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recycle 5 kg of plastic.", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp)),
                    SizedBox(height: 40.h),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                                child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          )
                        ),
                        Text("15 Points", style: TextStyle(fontSize: 40.sp, color:Color.fromARGB(255, 64, 64, 64), fontStyle: FontStyle.italic),)
                      ],
                    )
                    ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                border: Border(left: BorderSide(color: primaryColor, width:20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                    spreadRadius: 2,   // Extent of the shadow
                    blurRadius: 10,    // Softness of the shadow
                    offset: Offset(0, 6),
                    // Horizontal and vertical offset
                  ),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recycle 5 kg of plastic.", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp)),
                    SizedBox(height: 40.h),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    ),
                    SizedBox(height: 40.h),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                                child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          )
                        ),
                        Text("15 Points", style: TextStyle(fontSize: 40.sp, color:Color.fromARGB(255, 64, 64, 64), fontStyle: FontStyle.italic),)
                      ],
                    )
                    ],
                ),
              ),
                Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                border: Border(left: BorderSide(color: Color.fromRGBO(187, 213, 191, 1), width:20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                    spreadRadius: 2,   // Extent of the shadow
                    blurRadius: 10,    // Softness of the shadow
                    offset: Offset(0, 6),
                    // Horizontal and vertical offset
                  ),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recycle 5 kg of plastic.", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp)),
                    SizedBox(height: 40.h),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                                child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          )
                        ),
                        Text("15 Points", style: TextStyle(fontSize: 40.sp, color:Color.fromARGB(255, 64, 64, 64), fontStyle: FontStyle.italic),)
                      ],
                    )
                    ],
                ),
              ),
                Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                border: Border(left: BorderSide(color: Colors.black54, width:20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                    spreadRadius: 2,   // Extent of the shadow
                    blurRadius: 10,    // Softness of the shadow
                    offset: Offset(0, 6),
                    // Horizontal and vertical offset
                  ),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recycle 5 kg of plastic.", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp)),
                    SizedBox(height: 40.h),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                                child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          )
                        ),
                        Text("15 Points", style: TextStyle(fontSize: 40.sp, color:Color.fromARGB(255, 64, 64, 64), fontStyle: FontStyle.italic),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 220.h,
               )
      ],
    );
  }
}

class Earned extends StatefulWidget {
  const Earned({super.key});

  @override
  State<Earned> createState() => _EarnedState();
}

class _EarnedState extends State<Earned> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("No history", style: TextStyle(color: primaryColor),)
      ],
    );
  }
}
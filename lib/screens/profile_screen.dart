import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_finalprojects/screens/startup_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isDetailed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: IconButton(
        onPressed: (){
          setState(() {
            if(isDetailed){
              isDetailed = false;
            }
            else{
              isDetailed = true;
            }
          });
        }, 
        icon: Icon(Icons.menu, color:  Colors.white, size: 30,)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: isDetailed ? MoreProfile() : Align(
                alignment: Alignment.topCenter,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.w,558.h, 10.w,0),
                    child: Transform.flip(flipY: true,child: Hero(tag:"bottomup1",child: Row(spacing: 590.w,crossAxisAlignment: CrossAxisAlignment.end,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))]))),
                  ),
                  Hero(
                    tag: "bottomup",
                    child: Transform.flip(
                      flipY: true,
                      child: ClipPath(
                        clipper: BottomCurveClipper(),
                        child: Container(
                          color: Color.fromARGB(255, 27, 75, 61), // Your green color
                          height: 850.h,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 230.h),
                          child: CircleAvatar(
                            radius: 50.0,
                            child: Icon(Icons.person_2, color: primaryColor, size: 50),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 238.h,
                          width: 690.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primaryColor, width: 2),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("1324 \nPoints", style: TextStyle(color: primaryColor, fontSize: 50.sp),textAlign: TextAlign.center,),
                              Text("|", style: TextStyle(fontWeight: FontWeight.w100, fontSize: 150.sp, color:Colors.black45),),
                              Text("1324 \nRecycled", style: TextStyle(color: primaryColor,fontSize: 50.sp), textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(      
                                  margin: EdgeInsets.only(top: 90.h),    //Registered Bottle
                                  width: 990.w,
                                  decoration: BoxDecoration(
                                    color: primaryColor.withAlpha(90),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.sp,
                                      ),
                                      Row(
                                        spacing: 300.w,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Registered Bottles", style: TextStyle(color: Colors.black54)),
                                          TextButton(
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(primaryColor), 
                                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                            
                                            ),
                                          onPressed: (){
                                            
                                          }, 
                                          child: Icon(Icons.add, color: Colors.white))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          spacing:70.w,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Padding(
                                                 padding:  EdgeInsets.only(top: 50.h, bottom: 50.h, left: 60.w, right: 150.w),
                                                child: Row(
                                                  spacing: 30.w,
                                                  children: [
                                                    Image.asset('assets/single_bottle.png', height: 120.h,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("0", style: TextStyle(color:primaryColor, fontSize: 50.sp),),
                                                        Text("TODAY", style: TextStyle(color: Colors.grey, fontSize: 30.sp),)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.only(top: 50.h, bottom: 50.h, left: 20.w, right: 20.w),
                                                child: Row(
                                                  spacing: 30.w,
                                                  children: [
                                                    Image.asset('assets/many_bottle.png', height: 120.h,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("0", style: TextStyle(color:primaryColor, fontSize: 50.sp),),
                                                        Text("THIS MONTH", style: TextStyle(color: Colors.grey, fontSize: 30.sp),)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                        SizedBox(
                                          height: 80.h,
                                        )
                                ])),
                                Padding(
                                padding: EdgeInsets.only(left: 70.w, right: 70.w, top: 50.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text("Activity Progress", style: TextStyle(color: Colors.black54, fontSize: 50.sp)),
                                  TextButton(
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(58, 192, 153, 1))),
                                    onPressed: (){}, 
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Weekly", style: TextStyle(fontSize: 35.sp, color: Colors.black54)),
                                        Icon(Icons.arrow_right, color: Colors.black54,size:20,)
                                      ],
                                    ))
                                    ],
                                  ),
                                ),
                              Container(    
                                margin: EdgeInsets.only(right: 70.w, left: 70.w, top: 40.h),    
                                padding: EdgeInsets.fromLTRB(60.w, 100.h, 60.w, 100.h),  
                                decoration: BoxDecoration(
                                color: const Color.fromARGB(179, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                                  spreadRadius: 3,   // Extent of the shadow
                                  blurRadius: 10,    // Softness of the shadow
                                  offset: Offset(2, 6),
                                  // Horizontal and vertical offset
                                ),
                              ]),
                                                          
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Sun", style: TextStyle(color: primaryColor),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Mon", style: TextStyle(color: primaryColor),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Tue", style: TextStyle(color: primaryColor),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Wed", style: TextStyle(color: primaryColor),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Thu", style: TextStyle(color: primaryColor),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Fri", style: TextStyle(color: primaryColor),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                        ),
                                        Text("Sat", style: TextStyle(color: primaryColor),)
                                      ],
                                    )
                                ],
                              ),
                                                          )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ])
            ),
    );
  }
}



//detail profile

class MoreProfile extends StatefulWidget {
  const MoreProfile({super.key});

  @override
  State<MoreProfile> createState() => _MoreProfileState();
}

class _MoreProfileState extends State<MoreProfile> {
  @override
  Widget build(BuildContext context) {
    return  Align(
                alignment: Alignment.topCenter,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.w,558.h, 10.w,0),
                    child: Transform.flip(flipY: true,child: Hero(tag:"bottomup1",child: Row(spacing: 590.w,crossAxisAlignment: CrossAxisAlignment.end,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))]))),
                  ),
                  Hero(
                    tag: "bottomup",
                    child: Transform.flip(
                      flipY: true,
                      child: ClipPath(
                        clipper: BottomCurveClipper(),
                        child: Container(
                          color: Color.fromARGB(255, 27, 75, 61), // Your green color
                          height: 850.h,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 230.h),
                          child: CircleAvatar(
                            radius: 50.0,
                            child: Icon(Icons.person_2, color: primaryColor, size: 50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("Eros Lucagbo", style: TextStyle(fontSize: 60.sp),),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Account", style: TextStyle(fontSize: 50.sp),)
                          ],
                  
                        ),
                      )
                    ])]
                ));
  }
}
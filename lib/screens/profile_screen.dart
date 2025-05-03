import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_finalprojects/screens/startup_screen.dart';


class ProfileScreen extends StatefulWidget {
  final void Function(bool) isChangeColor;
  final Function(int) onNavigate;
  const ProfileScreen({super.key, required this.onNavigate, required this.isChangeColor});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {

  bool isDetailed = false;
  late AnimationController _controller;
  late Animation<Offset> _firstOffset;
  late Animation<Offset> _secondOffset;
  bool showFirst = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _setAnimations();
  }

  void _setAnimations() {
    _firstOffset = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 0.0), // move right
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _secondOffset = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // enter from left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleView() {
    if (showFirst) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    setState(() {
      showFirst = !showFirst;
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      floatingActionButton: IconButton(
        onPressed: () {
          _toggleView();        }, 
        icon: showFirst ? Icon(Icons.menu, color:  Colors.white, size: 30,) : Icon(Icons.keyboard_double_arrow_left_outlined, color: Colors.white, size: 30)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Align(
                alignment: Alignment.topCenter,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.w,558.h, 10.w,0),
                    child: Transform.flip(flipY: true,child: Row(spacing: 590.w,crossAxisAlignment: CrossAxisAlignment.end,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))])),
                  ),
                  Transform.flip(
                    flipY: true,
                    child: ClipPath(
                      clipper: BottomCurveClipper(),
                      child: Container(
                        color: Color.fromARGB(255, 27, 75, 61), // Your green color
                        height: 850.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                            padding: EdgeInsets.only(top: 200.h),
                            child: CircleAvatar(
                              radius: 50.0,
                              child: Icon(Icons.person_2, color: primaryColor, size: 50),
                            ),
                          ),
                  ),
                  SlideTransition(
                    position: _firstOffset,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 550.h),
                      child: Column(
                            children: [
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
                                                widget.onNavigate(2);
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
                                              ]),
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
                                                            
                                child: WeeklyActivity() )
                                ],
                              ),
                            ),
                          ),
                            
                              
                            ],
                          ),
                    ),
                  ),
                  SlideTransition(
                    position: _secondOffset,
                    child: MoreProfile()) ,
                ])
            ),
    );
  }
}


class WeeklyActivity extends StatefulWidget {
  const WeeklyActivity({super.key});

  @override
  State<WeeklyActivity> createState() => _WeeklyActivityState();
}

class _WeeklyActivityState extends State<WeeklyActivity> {
  @override
  Widget build(BuildContext context) {
    return  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Column(
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                            maxHeight: 250.h,
                                            maxWidth: 250.h
                                          ),
                                          height: 250.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.grey),
                                          child: RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.3,
                                                  backgroundColor: Colors.grey[300],
                                                  color: Color.fromRGBO(58, 192, 153, 1),
                                                  minHeight: 20,
                                                ),
                                              ),

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
                                          child:  RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.5,
                                                  backgroundColor: Colors.grey[300],
                                                  color: primaryColor,
                                                  minHeight: 20,
                                                ),
                                              ),
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
                                          child:  RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.8,
                                                  backgroundColor: Colors.grey[300],
                                                  color: Color.fromRGBO(58, 192, 153, 1),
                                                  minHeight: 20,
                                                ),
                                              ),
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
                                          child:  RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.9,
                                                  backgroundColor: Colors.grey[300],
                                                  color: primaryColor,
                                                  minHeight: 20,
                                                ),
                                              ),
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
                                          child:  RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.6,
                                                  backgroundColor: Colors.grey[300],
                                                  color: Color.fromRGBO(58, 192, 153, 1),
                                                  minHeight: 20,
                                                ),
                                              ),
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
                                          child:  RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.8,
                                                  backgroundColor: Colors.grey[300],
                                                  color: primaryColor,
                                                  minHeight: 20,
                                                ),
                                              ),
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
                                          child:  RotatedBox(
                                                quarterTurns: -1, // Rotate 90 degrees counter-clockwise
                                                child: LinearProgressIndicator(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                  value: 0.4,
                                                  backgroundColor: Colors.grey[300],
                                                  color: Color.fromRGBO(58, 192, 153, 1),
                                                  minHeight: 20,
                                                ),
                                              ),
                                        ),
                                        Text("Sat", style: TextStyle(color: primaryColor),)
                                      ],
                                    )
                                ],
                              );
  }
}

//detail profile

class MoreProfile extends StatefulWidget {

  const MoreProfile({super.key});
  
  @override
  State<MoreProfile> createState() => _MoreProfileState();
}

class _MoreProfileState extends State<MoreProfile>{

  bool isSwitch = true;

  void turnSwitch(bool value){
    setState(() {
      isSwitch = !isSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 540.h, left: 50.w, right: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                
                Text("Eros Lucagbo", style: TextStyle(fontSize: 60.sp, color: const Color.fromARGB(255, 255, 255, 255)),),
              ],
            ),
          ),
          SizedBox(
            height: 180.h,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40,10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
               boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                        spreadRadius: 3,   // Extent of the shadow
                        blurRadius: 10,    // Softness of the shadow
                        offset: Offset(2, 6),
                        // Horizontal and vertical offset
                      ),
                    ]
            ),
            child: Column(
            spacing: 35.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Account", style: TextStyle(fontSize: 50.sp, color: primaryColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20.w,
                  children: [
                    Icon(Icons.person_2_rounded, color: primaryColor),
                    Text("Personal Data", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w100),),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded, color: primaryColor,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20.w,
                  children: [
                    Icon(Icons.history, color: primaryColor),
                    Text("Activity History", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w100),),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded, color: primaryColor,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20.w,
                  children: [
                    Icon(Icons.wallet, color: primaryColor),
                    Text("Payment Method", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w100),),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded, color: primaryColor,)
              ],
            ),
            ]),
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40,10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
               boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                        spreadRadius: 3,   // Extent of the shadow
                        blurRadius: 10,    // Softness of the shadow
                        offset: Offset(2, 6),
                        // Horizontal and vertical offset
                      ),
                    ]
            ),
            child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Notification", style: TextStyle(fontSize: 50.sp, color: primaryColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20.w,
                  children: [
                    Icon(Icons.notifications_active_rounded, color: primaryColor),
                    Text("Pop-Up Notification", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w100),),
                  ],
                ),
                Switch(
                activeColor: primaryColor,
                splashRadius: 20,
                value: isSwitch, onChanged:turnSwitch)
              ],
            )
          ]),
        ),
        SizedBox(
            height: 50.h,
          ),
        Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40,20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
               boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                        spreadRadius: 3,   // Extent of the shadow
                        blurRadius: 10,    // Softness of the shadow
                        offset: Offset(2, 6),
                        // Horizontal and vertical offset
                      ),
                    ]
            ),
            child: Column(
            spacing: 35.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Other", style: TextStyle(fontSize: 50.sp, color: primaryColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20.w,
                  children: [
                    Icon(Icons.email, color: primaryColor),
                    Text("Contact Us", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w100),),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded, color: primaryColor,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(720.w, 0.h)),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/startup', (_) => false);
                  },
                  child: Row(
                    spacing: 8.w,
                    children: [
                      Icon(Icons.logout_outlined, color: primaryColor, size: 28,),
                      Text("Sign Out", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 40.sp),),
                    ],
                  ),
                )
              ],
            ),
            ]),
          ),


        






        ],
      ),
    );
  }
}
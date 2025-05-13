import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
                  alignment: Alignment.topLeft,
                  child: Container(height: 130,width: 120,decoration: BoxDecoration(color: Color.fromARGB(143, 27, 75, 61), borderRadius:BorderRadius.only(bottomRight: Radius.circular(200), bottomLeft: Radius.circular(10)) ),),
                ),
          Container(height: 80.h ,width: 180,decoration: BoxDecoration(color: Color.fromARGB(143, 27, 75, 61), borderRadius:BorderRadius.only(bottomRight: Radius.circular(200), bottomLeft: Radius.circular(200)), ),),
          Center(
          child: Column(
            spacing: 50.h,
            children: [
              Container(padding: EdgeInsets.only(top:300.h) ,
                      child: Hero(tag:"logo",child: Image(image: AssetImage('assets/logo.png'),)),
                    ),
              Column(
                spacing: 50.h,
                children: [
                  Text("Welcome to PlastiCash", 
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 50.sp, color: Colors.black)),
                  Padding(
                    padding: EdgeInsets.only(left: 50.w, right: 50.w),
                    child: Text("Plasticash is a student-led \ninitiative dedicated to promoting \nsustainability through technology \nand innovation", 
                    style: TextStyle(color: Colors.black, fontSize: 40.sp, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                  )
                ],
              ),
              SizedBox(height: 
              100.h),
              TextButton(
                style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(15))),padding: WidgetStatePropertyAll(EdgeInsets.only(left: 220.w, right: 220.w, top: 50.h, bottom: 50.h)), backgroundColor: WidgetStatePropertyAll(primaryColor)),
                onPressed: (){
                  Navigator.pushNamed(context, '/loginstart');
                }, 
                child: Text("GET STARTED", style: TextStyle(color: Colors.white, fontSize: 50.sp),))
              
              ]),
        ),
      ])

    );
  }
}





class LoginStart extends StatelessWidget {
  const LoginStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(height: 240.h,width: 260.w,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(200)) ),),
          )  ,
          // Curved green background at the bottom
          Align(
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40.w, 10, 50.w,0),
                  child: Hero(tag:"bottomup1",child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))])),
                ),
                Hero(
                  tag: "bottomup",
                  child: ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      color: Color.fromARGB(255, 27, 75, 61), // Your green color
                      height: 850.h,
                    ),
                  ),
                )
              ])
          ),

          // Content
          SingleChildScrollView(
              child: Padding(
                  padding:EdgeInsets.fromLTRB(50,122.h,50,0.h),
                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Column(children: [Container(padding: EdgeInsets.fromLTRB(0.w, 0.h,0.w,10.h) ,
                      child: Hero(tag:"logo",child: Image(image: AssetImage('assets/logo.png'),)),
                    ),Text("BOTTLE IT UP, CASH IT OUT", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 50.sp, color: Colors.black)), Text("You don't need therapy you need money :D", style: TextStyle(fontSize: 30.sp, color: Colors.black, fontWeight: FontWeight.normal))]),
                    SizedBox(height: 740.h,),
                    Column(children: [TextButton(
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 58, 192, 154)), textStyle: WidgetStatePropertyAll(TextStyle(color: Color.fromARGB(255, 3, 0,71))), fixedSize: WidgetStatePropertyAll(Size(300, 50.h)))
                        ,onPressed: (){
                      Navigator.pushNamed(
                        context, '/login'
                      );
                    }, child: Text("LOGIN", style: TextStyle(fontSize: 40.sp, color: Color.fromARGB(255, 3, 0, 71)),)),
                      SizedBox(height: 20.h),
                      Text("----------------OR----------------", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.normal, color: Colors.grey.shade100)),
                      SizedBox(height: 20.h),
                      OutlinedButton(style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(300, 50.h)), side: WidgetStatePropertyAll(BorderSide(color: Colors.white))),
                          onPressed: (){
                            Navigator.pushNamed(
                              context,'/signup'
                            );
                          },
                          child: Text("SIGN UP", style: TextStyle(fontSize: 40.sp, color: Colors.white)))]),
                  ])
              )
          ),
        ],
      ),
    );
  }
}

// Custom clipper for the curved background
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 90);
    path.quadraticBezierTo(size.width / 2 ,0, size.width, 90);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

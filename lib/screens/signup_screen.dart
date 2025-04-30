import 'package:flutter/material.dart';
import 'startup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        
        body: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(height: 140,width: 160,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomRight: Radius.circular(200)) ),),
                ),
                // Curved green background at the bottom
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 50,0),
                        child: Hero(tag: "bottomup1",child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))])),
                      ),
                      Hero(
                        tag: "bottomup",
                        child: ClipPath(
                          clipper: BottomCurveClipper(),
                          child: Container(
                            color: Color.fromARGB(255, 27, 75, 61), // Your green color
                            height: 1720.h,
                          ),
                        ),
                      )
                    ])
                ),
                  
                Padding(
                    padding:EdgeInsets.fromLTRB(50,200.h,50,0.h),
                    child: Column( spacing: 180.h, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(0, 0,0,10) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 550.h,)),
                      )]),
                      Column(spacing:  60.h, crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Create Account",style: TextStyle(fontSize: 90.sp),),
                      
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label:Text("Username", style: TextStyle(color: Colors.white),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 40.sp),
                          cursorColor: Colors.white,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text("Email:",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            ),
                            style: TextStyle(color: Colors.white,fontSize: 40.sp),
                            cursorColor: Colors.white
                        ),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(label: Text("Password:", style: TextStyle(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 40.sp),
                            cursorColor: Colors.white
                            ,obscureText: true,
                
                        ),
                      
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(label:Text("Confirm Password:", style: TextStyle(color: Colors.white),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white))
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 40.sp),
                          cursorColor: Colors.white,
                          obscureText: true,
                        ),
                      
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){}, style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(347.w, 26.h)), backgroundColor: WidgetStatePropertyAll(Colors.white)),  child: Text("SIGN UP", style: TextStyle(fontSize: 45.sp, color: Color.fromARGB(255, 27, 75, 61)))),
                            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Already Have an Account?", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30.sp)),
                              TextButton(
                                  onPressed:(){
                                    Navigator.pushNamed(context, '/login');
                            }, child: Text("Login Now!",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.green,decoration: TextDecoration.underline, decorationColor: Colors.green, fontSize: 30.sp)))
                            ])
                          ],
                        ),
                      ]),
                    ])
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(icon: Icon(Icons.arrow_back_rounded), color: Color.fromARGB(255, 255, 255, 255), iconSize: 50, padding: EdgeInsets.fromLTRB(20, 40,0,0),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/startup', (_) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),),
    );
  }
}




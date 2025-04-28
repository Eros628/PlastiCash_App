import 'package:flutter/material.dart';
import '/screens/startup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();


  final String email = "eroslucagbo@gmail.com";
  final String password = "1234";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                            height: 1400.h,
                          ),
                        ),
                      )
                    ])
                ),
            
                // Content
                Padding(
                    padding:EdgeInsets.fromLTRB(50,290.h,50, 0),
                    child: Column(spacing: 280.h, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(0.w, 0.h,0.w,10.h) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 700.h,)),
                      )]),
                      
                      Column(spacing:  50.h, crossAxisAlignment: CrossAxisAlignment.center,children: [Text("Login",style: TextStyle(fontSize: 100.sp)),
                        TextField(
                            controller: emailController,
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
                          controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              
                              label: Text("Password:", style: TextStyle(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), 
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                }, 
                                icon: Icon(
                                  _obscureText ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.white
                              ))
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 40.sp),
                            cursorColor: Colors.white
                        ),
                        Column(
                          children: [
                            Center(child: TextButton(
                              onPressed: (){
                                if (email == emailController.text && passwordController.text == password){
                                  Navigator.pushNamed(context, '/home');
                                }
                              }, 
                            style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(150, 26.h)), backgroundColor: WidgetStatePropertyAll(Colors.white)),  
                            child: Text("LOGIN", style: TextStyle(fontSize: 40.sp, color: Color.fromARGB(255, 27, 75, 61))))),
                            Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Don’t have an accont yet?", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35.sp)),
                              TextButton(
                                  onPressed:(){
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                  child: Text("Register Now!",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.green,decoration: TextDecoration.underline, decorationColor: Colors.green, fontSize: 35.sp)))
                            ])
                          ],
                        ),
                      ]),
                    ])
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(icon: Icon(Icons.arrow_back_rounded), color: Color.fromARGB(255, 255, 255, 255), iconSize: 50, padding: EdgeInsets.fromLTRB(20.w, 40.h,0.w,0.h),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/startup', (_) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
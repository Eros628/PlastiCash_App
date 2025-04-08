import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/login_screen.dart';
import 'startup_screen.dart';


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
        body: Stack(
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
                        height: 660,
                      ),
                    ),
                  )
                ])
            ),
      
            SingleChildScrollView(
                child: Padding(
                    padding:EdgeInsets.fromLTRB(50,70,50,0),
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(0, 0,0,10) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 250,)),
                      )]),
                      SizedBox(height: 50,),
                      Column(spacing:  20, crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Create Account",style: TextStyle(fontSize: 40),),
      
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label:Text("Username", style: TextStyle(color: Colors.white),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          cursorColor: Colors.white,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text("Email:",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            ),
                            style: TextStyle(color: Colors.white,fontSize: 18),
                            cursorColor: Colors.white
                        ),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(label: Text("Password:", style: TextStyle(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            cursorColor: Colors.white
                            ,obscureText: true,

                        ),
      
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(label:Text("Confirm Password:", style: TextStyle(color: Colors.white),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white))
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          cursorColor: Colors.white,
                          obscureText: true,
                        ),
      
                        Column(crossAxisAlignment: CrossAxisAlignment.start
                          ,
                          children: [
                            TextButton(onPressed: (){}, style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(147, 26)), backgroundColor: WidgetStatePropertyAll(Colors.white)),  child: Text("SIGN UP", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 27, 75, 61)))),
                            Row(children: [Text("Already Have an Account?", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13)),
                              TextButton(
                                  onPressed:(){
                                    Navigator.pushNamed(context, '/login');
                            }, child: Text("Login Now!",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.green,decoration: TextDecoration.underline, decorationColor: Colors.green, fontSize: 13)))
                            ])
                          ],
                        ),
                      ]),
                    ])
                )
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
        ),),
    );
  }
}




import 'package:flutter/material.dart';
import '/screens/startup_screen.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
                        height: 600,
                      ),
                    ),
                  )
                ])
            ),

            // Content
            SingleChildScrollView(
                child: Padding(
                    padding:EdgeInsets.fromLTRB(50,120,50,0),
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Column(children: [Container(padding: EdgeInsets.fromLTRB(0, 0,0,10) ,
                        child: Hero( tag:"logo",child: Image(image: AssetImage('assets/logo.png'),height: 250,)),
                      )]),
                      SizedBox(height: 70,),
                      Column(spacing:  40, crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Login",style: TextStyle(fontSize: 40),),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text("Email:",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            ),
                            style: TextStyle(color: Colors.white,fontSize: 20),
                            cursorColor: Colors.white
                        ),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(label: Text("Password:", style: TextStyle(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            cursorColor: Colors.white
                        ),
                        Column(
                          children: [
                            Center(child: TextButton(onPressed: (){}, style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(147, 26)), backgroundColor: WidgetStatePropertyAll(Colors.white)),  child: Text("LOGIN", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 27, 75, 61))))),
                            Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Don’t have an accont yet?", style: TextStyle(fontWeight: FontWeight.normal)), TextButton(onPressed:(){}, child: Text("Register Now!",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.green,decoration: TextDecoration.underline, decorationColor: Colors.green)))
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
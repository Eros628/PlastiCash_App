import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/signup_screen.dart';
import '/screens/login_screen.dart';


class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(height: 140,width: 160,decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius:BorderRadius.only(bottomLeft: Radius.circular(200)) ),),
          )  ,
          // Curved green background at the bottom
          Align(
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 50,0),
                  child: Hero(tag:"bottomup1",child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[Image(image:AssetImage('assets/leaf2.png')), Image(image:AssetImage('assets/leaf1.png'))])),
                ),
                Hero(
                  tag: "bottomup",
                  child: ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      color: Color.fromARGB(255, 27, 75, 61), // Your green color
                      height: 400,
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
                      child: Hero(tag:"logo",child: Image(image: AssetImage('assets/logo.png'),)),
                    ),Text("BOTTLE IT UP, CASH IT OUT", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black)), Text("You don't need therapy you need money :D", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal))]),
                    SizedBox(height: 150,),
                    Column(children: [TextButton(
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 58, 192, 154)), textStyle: WidgetStatePropertyAll(TextStyle(color: Color.fromARGB(255, 3, 0,71))), fixedSize: WidgetStatePropertyAll(Size(320, 50)))
                        ,onPressed: (){
                      Navigator.pushNamed(
                        context, '/login'
                      );
                    }, child: Text("LOGIN", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 3, 0, 71)),)),
                      SizedBox(height: 20),
                      Text("----------------OR----------------", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey.shade100)),
                      SizedBox(height: 20),
                      OutlinedButton(style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(320, 50)), side: WidgetStatePropertyAll(BorderSide(color: Colors.white))),
                          onPressed: (){
                            Navigator.pushNamed(
                              context,'/signup'
                            );
                          },
                          child: Text("SIGN UP", style: TextStyle(fontSize: 20, color: Colors.white)))]),
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

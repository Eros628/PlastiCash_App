import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
            height: 365.0,
            decoration:BoxDecoration(color: const Color.fromARGB(255,211, 241, 223), borderRadius:BorderRadius.horizontal(left: Radius.circular(65), right: Radius.zero))
            ,child: Column(
            children: [Div1(), Div2()])
        )
    );
  }
}

class Div1 extends StatelessWidget
{
  const Div1({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          spacing: 100,
          children:[Padding(
              padding: const EdgeInsets.fromLTRB(36, 56, 36, 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Good Morning,", style: TextStyle(fontSize: 25, color: Colors.green.shade900),), Text("Eros Lucagbo", style: TextStyle(fontSize: 18, color: Colors.green.shade800, fontWeight: FontWeight.normal))])),
            Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                height: 50,
                width: 50,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))),
                child:Icon(Icons.notifications, size: 30, ))
          ]),
    );

  }
}

class Div2 extends StatelessWidget
{
  const Div2({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      width: 370,
      decoration: BoxDecoration(color: Color.fromARGB(255, 27, 75, 61), borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Row(
                spacing: 70,
                children:[Text("Total Collected Bottles", style: TextStyle(fontSize: 20),), Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(50))),  child: Icon(Icons.more_horiz, color: Colors.black,))]),
              Text("-----------------------------------------", style: TextStyle(fontWeight: FontWeight.w400)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: Row(
                    spacing: 50,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [Text("Today", style: TextStyle(fontWeight: FontWeight.normal)),Row(children: [Icon(Icons.arrow_upward_sharp, color: Colors.white,), Text("3 Bottles", style: TextStyle(fontSize: 18))])]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [Text("This Month",style: TextStyle(fontWeight: FontWeight.normal)), Row(children: [Icon(Icons.arrow_upward_sharp, color: Colors.white,), Text("26 Bottles",style: TextStyle(fontSize: 18))])])
                    ]),
              )
            ]),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:async';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();
  bool _isBottomNavVisible = false;
  Timer? _scrollingTimer;

  @override 
  void initState(){
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener(){
    if(_scrollController.position.isScrollingNotifier.value && !_isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = true;
        });
    }
    if (_scrollingTimer != null) {
        _scrollingTimer!.cancel();
    }

    _scrollingTimer = Timer(const Duration(seconds: 5), () {
        setState(() {
          _isBottomNavVisible = false;  // Hide bottom nav after 2 seconds of inactivity
        });
      });
  }
  
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          
          children: [
            // First container with Div1 and Div2
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 241, 223),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(65), right: Radius.zero),
              ),
              height: 367,
              child: Column(children: [Div1(), Div2()]),
            ),
            Container(height: 50, color: Color.fromARGB(255, 211, 241, 223)),
            
            // Div3 with translation applied
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -50), // Move up by 50 pixels
                child: SingleChildScrollView(controller: _scrollController,child: Div3()),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isBottomNavVisible ? kBottomNavigationBarHeight:0,
        child: Wrap(
            children:[ Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: BottomNavigationBar(
              elevation: 0,
              iconSize: 30,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels:true,
              showSelectedLabels: true,
              selectedItemColor: Colors.green,
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.pin_drop_outlined), label: 'Location'),
              BottomNavigationBarItem(icon: Image.asset('assets/logoIcon.png'), label: 'About Us'),
              BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart_outlined), label: 'Milestone'),
              BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Profile')
              
                        ]),
            ),
            ],

        ),
      ),
    );
  }
}

class Div1 extends StatefulWidget
{
  const Div1({super.key});

  @override
  State<Div1> createState() => _Div1State();
}

class _Div1State extends State<Div1> {
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

class Div2 extends StatefulWidget
{
  const Div2({super.key});

  @override
  State<Div2> createState() => _Div2State();
}

class _Div2State extends State<Div2> {
  @override
  Widget build(BuildContext context) {

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


class Div3 extends StatefulWidget {
  const Div3({super.key});

  @override
  State<Div3> createState() => _Div3State();
}

class _Div3State extends State<Div3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(65))),
      child: Column(
        children: [
          Div3MapSection(),SizedBox(height: 10,), MilestoneSection(),SizedBox(height: 10,), Div3AboutUs()
        ],
      ),
    );
  }
}


class Div3MapSection extends StatefulWidget {
  const Div3MapSection({super.key});

  @override
  State<Div3MapSection> createState() => _Div3MapSectionState();
}

class _Div3MapSectionState extends State<Div3MapSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Suggested Location",
              style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
            ),
            SizedBox(width: 100), // Adjust this to control space between widgets
            TextButton(
              onPressed: () {},
              child: Text(
                "Expand",
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
              ),
            ),
          ],
        ),
        Container(
          height: 192,
          width: 352,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        SizedBox(height: 10,),
      ]
    );
  }
}

class MilestoneSection extends StatefulWidget {
  const MilestoneSection({super.key});

  @override
  State<MilestoneSection> createState() => _MilestoneSectionState();
}

class _MilestoneSectionState extends State<MilestoneSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Milestones",
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
              ),
              SizedBox(width: 185), // Adjust space between widgets
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
                ),
              ),
            ],
          ),
        Container(
          height: 192,
          width: 352,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
    ]);
  } 
}

class Div3AboutUs extends StatelessWidget {
  const Div3AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About Us",
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
              ),
              SizedBox(width: 185), // Adjust space between widgets
              TextButton(
                onPressed: () {},
                child: Text(
                  "More",
                  style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
                ),
              ),
            ],
          ),
        Container(
          height: 192,
          width: 352,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
    ]);
  }
}
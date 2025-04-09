import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_finalprojects/screens/aboutus_screen.dart';
import 'package:flutter_finalprojects/screens/map_screen.dart';
import 'package:flutter_finalprojects/screens/milestone_screen.dart';
import 'package:flutter_finalprojects/screens/profile_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

final bugoMarker = Marker(
  point: LatLng(8.5003, 124.7824), // Bugo, CDO
  child: Image.asset('assets/logoIcon.png') );


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget _buildHomeContent() {
    return SizedBox(
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
                child: SingleChildScrollView(child: Div3(onNavigate: (int newIndex) {
                  setState(() {
                    _currentIndex = newIndex;
                  });
                })),
              ),
            ),
          ],
        ),
      );
  }

   List<Widget> get _screens => [
    _buildHomeContent(),
    MapScreen(),
    AboutusScreen(),
    MilestoneScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Colors.green,
          elevation: 0,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop_outlined),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/logoIcon.png'),
              label: 'About Us',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_outlined),
              label: 'Milestone',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
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
  final ValueChanged<int> onNavigate;
  const Div3({super.key, required this.onNavigate});

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
          Div3MapSection(onNavigate: widget.onNavigate),SizedBox(height: 10,), MilestoneSection(onNavigate: widget.onNavigate,),SizedBox(height: 10,), Div3AboutUs()
        ],
      ),
    );
  }
}


class Div3MapSection extends StatefulWidget {
  final ValueChanged<int> onNavigate;  // Callback for navigation

  const Div3MapSection({super.key, required this.onNavigate});

  @override
  State<Div3MapSection> createState() => _Div3MapSectionState();
}


class _Div3MapSectionState extends State<Div3MapSection> {
  final MapController _mapController = MapController();

 
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
              onPressed: () {
                widget.onNavigate(1);
              },
              child: Text(
                "Expand",
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 192,
          width: 352,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Hero(
                tag: "map",
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: const LatLng( 8.5003, 124.7824),
                    initialZoom: 12,
                    minZoom: 8, // Optional: Set a min zoom level
                    maxZoom: 18,
                
                  ) 
                  ,children: [
                    OutlinedButton(
                      style: ButtonStyle(shape:WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))
                      ))),
                      onPressed: () {
                        widget.onNavigate(1);
                      },
                      child: TileLayer(urlTemplate:'https://tile.openstreetmap.org/{z}/{x}/{y}.png' ,))
                    ,MarkerLayer(markers: [bugoMarker])
                  ]
                  ),
              ),
          ),
        ),
        SizedBox(height: 10,),
      ]
    );
  }
}

class MilestoneSection extends StatefulWidget {
  final ValueChanged<int> onNavigate;
  const MilestoneSection({super.key, required this.onNavigate});

  @override
  State<MilestoneSection> createState() => _MilestoneSectionState();
}

class _MilestoneSectionState extends State<MilestoneSection> {
  int  currentValue = 20;
  int  maxValue = 100;
  double get progress => currentValue / maxValue;
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
                onPressed: () {
                  widget.onNavigate(1);
                },
                child: Text(
                  "See All",
                  style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 18),
                ),
              ),
            ],
          ),
        Container(
          padding: EdgeInsets.only(top: 10),
          height: 270,
          width: 352,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                  border: Border(left: BorderSide(color: Colors.blue.shade200, width:10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                      spreadRadius: 2,   // Extent of the shadow
                      blurRadius: 10,    // Softness of the shadow
                      offset: Offset(0, 6),
                       // Horizontal and vertical offset
                    ),
                  ],
                  
                  ),
                
                child: Column(
                  children: [
                    Text("Recycle 5 kg of plastic (P20 bonus).", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 15)),
                    SizedBox(height: 20,),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value: progress +0.1,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    )
                  
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(left: BorderSide(color: Colors.green.shade900, width:10 )),
                   boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                      spreadRadius: 2,   // Extent of the shadow
                      blurRadius: 10,    // Softness of the shadow
                      offset: Offset(0, 6),
                       // Horizontal and vertical offset
                    ),
                  ],
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recycle 50 kg of plastic\n(P100 bonus)", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 15)),
                    SizedBox(height: 20,),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    )
                  ],
                ),
              )
            ],
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
        SizedBox(height: 60,)
    ]);
  }
}
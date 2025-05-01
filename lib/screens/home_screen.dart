import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/aboutus_screen.dart';
import 'package:flutter_finalprojects/screens/map_screen.dart';
import 'package:flutter_finalprojects/screens/reward_screen.dart';
import 'package:flutter_finalprojects/screens/profile_screen.dart';
import 'package:flutter_finalprojects/screens/qr_scanner.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



const Color primaryColor =  Color.fromARGB(255, 27, 75, 61);
final LatLng bugoCoords = LatLng(8.5003, 124.7824);
int _currentIndex = 0;

final bugoMarker = Marker(
  point: LatLng(8.5003, 124.7824), // Bugo, CDO
  child: Image.asset('assets/logoIcon.png') );


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              height: 967.h,
              child: Column(children: [Div1(), Div2()]),
            ),
            Container(height: 200.h, color: Color.fromARGB(255, 211, 241, 223)),
            
            // Div3 with translation applied
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -70), // Move up by 50 pixels
                child: SingleChildScrollView(child: Div3(onNavigate: (int newIndex) {
                  setState(() {
                    _currentIndex= newIndex;
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
    QrScanner(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex= value;
          });
        },
        
        backgroundColor:  Colors.transparent,
        color: primaryColor,

        items:  [
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.pin_drop_outlined, color: Colors.white, ),
          Icon(Icons.qr_code_scanner, size: 34, color: Colors.white,),
          Icon(Icons.emoji_events,  color: Colors.white,),
          Icon(Icons.person_2_rounded,  color: Colors.white,),
          
        ],
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
    return Row(
        spacing: 100.w,
        children:[Padding(
            padding: const EdgeInsets.fromLTRB(36, 56, 36, 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Good Morning,", style: TextStyle(fontSize: 70.sp, color: Colors.green.shade900),), Text("Eros Lucagbo", style: TextStyle(fontSize: 60.sp, color: Colors.green.shade800, fontWeight: FontWeight.normal))])),
          Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))),
              child:Icon(Icons.notifications, size: 30, ))
        ]);

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
      height: 480.h,
      width: 952.w,
      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Row(
                spacing: 70.w,
                children:[Text("Total Collected Bottles", style: TextStyle(fontSize: 60.sp),), Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(50))),  child: Icon(Icons.more_horiz, color: Colors.black,))]),
              Text("------------------------------", style: TextStyle(fontWeight: FontWeight.w400)),
              Padding(
                padding:  EdgeInsets.fromLTRB(0,10.h,0,0),
                child: Row(
                    spacing: 100.w,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [Text("Today", style: TextStyle(fontWeight: FontWeight.normal)),Row(children: [Icon(Icons.arrow_upward_sharp, color: Colors.white,), Text("3 Bottles", style: TextStyle(fontSize: 40.sp))])]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [Text("This Month",style: TextStyle(fontWeight: FontWeight.normal)), Row(children: [Icon(Icons.arrow_upward_sharp, color: Colors.white,), Text("26 Bottles",style: TextStyle(fontSize: 40.sp))])])
                      
                    
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
          Div3MapSection(onNavigate: widget.onNavigate),SizedBox(height: 20.h,), MilestoneSection(onNavigate: widget.onNavigate,),SizedBox(height: 20.h,), Div3AboutUs()
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
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Suggested Location",
              style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp),
            ),
            SizedBox(width: 200.w), // Adjust this to control space between widgets
            TextButton(
              onPressed: () {
                widget.onNavigate(1);
              },
              child: Text(
                "Expand",
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 592.h,
          width: 952.w,
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
        SizedBox(height: 20.h,),
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
                "Challenges",
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp),
              ),
              SizedBox(width: 385.w), // Adjust space between widgets
              TextButton(
                onPressed: () {
                  widget.onNavigate(3);
                },
                child: Text(
                  "See All",
                  style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp),
                ),
              ),
            ],
          ),
        Padding(
          padding: EdgeInsets.only(left: 50.w, right: 50.w),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index){
              return ChallengesCard(
                text: challenges[index].text, 
                progress: challenges[index].progress , 
                points: challenges[index].points, 
                onClaim: (){
                  setState(() {
                    challenges.removeAt(index);
                  });
                },
                index: index,
                color: challenges[index].color, 
              );
          }),
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
                style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp),
              ),
              SizedBox(width: 385.w), // Adjust space between widgets
              TextButton(
                onPressed: () {},
                child: Text(
                  "More",
                  style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp),
                ),
              ),
            ],
          ),
        Container(
          height: 592.h,
          width: 952.w,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        SizedBox(height: 120.h,)
    ]);
  }
}
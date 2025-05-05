import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'redeem_screen.dart';


List <Challenges> challenges = [
    Challenges(text: "Recycle 5 kg of plastic", points: "15 Points", progress: 1.0, color: Color.fromRGBO(144, 202, 249, 1)),
    Challenges(text: "Recycle 5 kg of plastic", points: "15 Points", progress: 0.0, color: primaryColor),
    Challenges(text: "Recycle 5 kg of plastic", points: "15 Points", progress: 0.0, color: Color.fromRGBO(187, 213, 191, 1)),
    Challenges(text: "Recycle 5 kg of plastic", points: "15 Points", progress: 0.0, color: Color.fromRGBO(0, 0, 0, 0.541) ),
];

List<Challenges> earned = [];
bool goToRedeem = false;


class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  
  bool iSEarned = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: goToRedeem? RedeemScreen() : Column(
        children: [
          Container(
            height: 800.h,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 140.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                  Text("Rewards", style: TextStyle(fontSize: 80.sp)),
                  Column(
                    spacing: 20.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 20.w),
                        child: Text("Your Balance", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40.sp),),
                      ),
                      Stack(
                        children:[ 
                          Container(
                          height: 450.h,
                          width: 450.w,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: primaryColor, width: 3), shape: BoxShape.circle),
                              child: Padding(
                                padding: EdgeInsets.all(90.h),
                                child: Text("0\nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        ),
                       
                        Positioned(
                          bottom: -5,
                          left:16,
                          child: TextButton(
                          onPressed: (){
                             setState(() {
                               goToRedeem = true;
                             });
                          }, 
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(187, 213, 191, 1)),padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(80.w, 20.h, 80.w, 20.h))),
                          child: Text("REDEEM", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 50.sp),)),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 50.w,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: iSEarned ? WidgetStatePropertyAll(Colors.transparent): WidgetStatePropertyAll(primaryColor),
                            side: WidgetStatePropertyAll(BorderSide(color: Colors.black45, width: 2)),
                            padding: WidgetStatePropertyAll(EdgeInsets.only(left: 50.w, right: 50.w)),
                            ),
                          onPressed: (){
                            setState(() {
                              iSEarned = false;
                            });
                          }, 
                          child: Text("Rewards", style: iSEarned? TextStyle(color: primaryColor):TextStyle(color: Colors.white),)),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: iSEarned ? WidgetStatePropertyAll(primaryColor): WidgetStatePropertyAll(Colors.transparent),
                            side: WidgetStatePropertyAll(BorderSide(color: Colors.black45, width: 2)),
                            padding: WidgetStatePropertyAll(EdgeInsets.only(left: 60.w, right: 60.w))),
                          onPressed: (){
                            setState(() {
                              iSEarned = true;
                            });
                          }, 
                          child: Text("Earned", style: iSEarned? TextStyle(color: Colors.white):TextStyle(color: primaryColor),))
                      ],
                    ),

                    Container(
                      child: iSEarned ? Earned() : Rewards(),
                    )

                    
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Challenges{
  late final String text;
  late final String points;
  late final double progress;
  late final Color color;
  late final bool isClaimed;

  Challenges({required this.text, required this.points, required this.progress, required this.color, this.isClaimed = false});
}

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  
  final ScrollController _scrollController_r = ScrollController();

  void _scrollToEnd() {
    _scrollController_r.animateTo(
      _scrollController_r.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

   void _scrollToStart() {
    _scrollController_r.animateTo(
      _scrollController_r.position.minScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 30.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 70.w, right: 70.w),
          child: Text("Daily Bonus", style: TextStyle(color:  Color.fromARGB(255, 64, 64, 64), fontSize: 50.sp)),
        ),
        SingleChildScrollView(
          controller: _scrollController_r,
          scrollDirection: Axis.horizontal,
          child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: Row(
              children: [
                  IconButton(
                    onPressed: _scrollToEnd, 
                    icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 150.h,)),
                  Container( //Bonus 1
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(187, 213, 191, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                      ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20.h,
                        children: [
                          Text("10 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                          Text("Daily Login", style: TextStyle(color: primaryColor, fontSize: 40.sp)),
                          TextButton(
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                            onPressed: (){}, 
                            child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                              child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                            ) )
                        ],
                      ),
                    ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container( //Bonus 2
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,164, 173, 170),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                      ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.h,
                      children: [
                        Text("35 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                        Text("Complete \nTwo Challenges", style: TextStyle(color: primaryColor, fontSize: 30.sp), textAlign: TextAlign.center,),
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black54),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                            child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          ) )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container( //Bonus 3
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,164, 173, 170),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20.h,
                      children: [
                        Text("30 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                        Text("Deposit 10 Bottles", style: TextStyle(color: primaryColor, fontSize: 40.sp)),
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black54),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                            child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          ) )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    height: 500.h,
                    width: 470.w,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,164, 173, 170),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black26
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.h,
                      children: [
                        Text("50 \nPoints", style: TextStyle(color: primaryColor, fontSize: 60.sp),textAlign: TextAlign.center),
                        Text("Receive Rewards\n Via App", style: TextStyle(color: primaryColor, fontSize: 30.sp), textAlign: TextAlign.center,),
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black54),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){}, 
                          child:Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                            child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          ) )
                      ],
                    ),
                  ),
                      
                  IconButton(
                    onPressed: _scrollToStart, 
                    icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 150.h,textDirection: TextDirection.rtl,))
                ],
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
          ),
        Padding(
          padding: EdgeInsets.only(left: 70.w, right: 70.w),
          child: Text("Challenges", style: TextStyle(color:  Color.fromARGB(255, 64, 64, 64), fontSize: 50.sp)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 70.w, right: 70.w),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: challenges.length,
            itemBuilder: (context, index){
              return ChallengesCard(
                text: challenges[index].text, 
                progress: challenges[index].progress , 
                points: challenges[index].points, 
                onClaim: (){
                  setState(() {
                    challenges.removeAt(index);
                    earned.add(challenges[index]);
                  });
                },
                index: index,
                color: challenges[index].color,
                
                );
          }),
        ),
        SizedBox(
          height: 220.h,
          )
      ],
    );
  }
}



class ChallengesCard extends StatefulWidget {
  final String text;
  final double progress;
  final String points;
  final Color color;
  final int index;
  final VoidCallback onClaim;
  const ChallengesCard({super.key, required this.text, required this.progress, required this.points, required this.onClaim, required this.index, required this.color});

  @override
  State<ChallengesCard> createState() => _ChallengesState();
}

class _ChallengesState extends State<ChallengesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 30.h),
      child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                border: Border(left: BorderSide(color: widget.color, width:20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                    spreadRadius: 2,   // Extent of the shadow
                    blurRadius: 10,    // Softness of the shadow
                    offset: Offset(0, 6),
                    // Horizontal and vertical offset
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.text, style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontSize: 40.sp)),
                    SizedBox(height: 40.h),
                    SizedBox(
                      child: LinearProgressIndicator(
                        value:widget.progress,
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        minHeight: 5,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(backgroundColor: widget.progress== 1.0 ? WidgetStatePropertyAll(primaryColor) : WidgetStatePropertyAll((Colors.black54)),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
                          onPressed: (){
                            if (widget.progress == 1.0){
                                widget.onClaim();
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Complete the challenge first to earn your points.", style: TextStyle(fontSize: 30.sp),)
                                )
                              );
                            }
                          }, 
                          child:Padding(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 0, bottom: 0),
                                child: Text("Claim", style: TextStyle(fontSize: 40.sp, color: Colors.white),),
                          )
                        ),
                        Text(widget.points, style: TextStyle(fontSize: 40.sp, color:Color.fromARGB(255, 64, 64, 64), fontStyle: FontStyle.italic),)
                      ],
                    )
                  ])
      )
    );
  }
}



class Earned extends StatefulWidget {
  const Earned({super.key});

  @override
  State<Earned> createState() => _EarnedState();
}

class _EarnedState extends State<Earned> {
  @override
  Widget build(BuildContext context) {
    return earned.isEmpty?  Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
        child: Text("No Rewards Claimed", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64))),
      ),
    )
    :
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 0, left: 70.w, right: 70.w),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: earned.length,
          itemBuilder:(context, index){
            return Container(
              padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.white,
                border: Border(left: BorderSide(color: Colors.lightBlue, width:20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0), // Shadow color
                    spreadRadius: 2,   // Extent of the shadow
                    blurRadius: 10,    // Softness of the shadow
                    offset: Offset(0, 6),
                    // Horizontal and vertical offset
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Claimed", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64)),),
                      Text(earned[index].points, style: TextStyle(color: Color.fromARGB(255, 64, 64, 64))),
                    ],
                  ),
                  Text("24 May 2024", style: TextStyle(color: Color.fromARGB(255, 64, 64, 64), fontWeight: FontWeight.normal))
                ],
              ),
            );
          } )
      ],
    );
  }
}
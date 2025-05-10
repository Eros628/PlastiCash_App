import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {
  final User? user;
  
  final CollectionReference firestore = FirebaseFirestore.instance.collection("users");
  final CollectionReference<Map<String, dynamic>> firestoreTask = FirebaseFirestore.instance.collection("tasks");

  int totalBottles = 0;
  int totalPoints = 0;

  // Public constructor
  DatabaseService({this.user});


  Future<void> initializeDB() async {
    try {
        await firestore.doc(user!.uid).set({
          "Bottles": 0,
          "Name": user!.displayName,
          "Payout Method": "Gcash",
          "Points": 0,
        });

    } catch (e) {
      print(e);
    }
  }
  //users data

  Future<List<int>> getWeeklyActivity(List<QueryDocumentSnapshot<Map<String, dynamic>>> dates) async{
    List<int> day = List.filled(7, 0); 
    DateTime datenow = DateTime.now();

    DateTime startOfWeek = datenow.subtract(Duration(days: datenow.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    
    for(var doc in dates){
      Map<String, dynamic> data = doc.data();

     
      if((data["Date"] != null) && (data["Action"] == "ScanQr")){
        DateTime activityDate = (data["Date"] as Timestamp).toDate();
        
        if((activityDate.day >= startOfWeek.day)&& (activityDate.day <=endOfWeek.day)){
            switch (activityDate.weekday){
              case 1: 
                day[0]+= data["Bottles"] as int;
              case 2:
                day[1]+= data["Bottles"] as int;
              case 3:
                day[2]+= data["Bottles"] as int;
              case 4: 
                day[3]+= data["Bottles"] as int;
              case 5:
                day[4]+= data["Bottles"] as int;
              case 6:
                day[5]+= data["Bottles"] as int;
              case 7:
                day[6]+= data["Bottles"] as int;
            }
        }
      }
    }
    return day;

  }

  Future<int> getTotalPoints(List<QueryDocumentSnapshot<Map<String, dynamic>>> points)async{
    int totalPoints = 0;
    for(var doc in points){
      Map<String, dynamic> data = doc.data();

      if(!(data["Action"]== "Redeem")){
        totalPoints += ( data["Points"] as num).toInt();
      }
    }
    return totalPoints;
  }

  Future<int> getTotalBottle(List<QueryDocumentSnapshot<Map<String, dynamic>>> bottles)async{
    int totalBottles = 0;
    for(var doc in bottles){
      Map<String, dynamic> data = doc.data();
      if(data["Action"] == "ScanQr"){
        totalBottles += ( data["Bottles"] as num).toInt();
      }
    }
    return totalBottles;
  }

  Future<int> getTodayBottle(List<QueryDocumentSnapshot<Map<String, dynamic>>> todayBottle)async{
    int totalBottle = 0;
    DateTime datenow = DateTime.now();
    for(var doc in todayBottle){
        Map<String, dynamic> data = doc.data();
        if(data["Action"] == "ScanQr"){
          if(data["Date"]!= null ){
          
          DateTime activityDate = (data["Date"] as Timestamp).toDate();

          bool isToday = activityDate.year == datenow.year &&
                     activityDate.month == datenow.month &&
                     activityDate.day == datenow.day;

          if(isToday){
            
            totalBottle += ( data["Bottles"] as num).toInt();
          }
        }
        else{
      
          return 0;
        }
        }
        
    }

    return totalBottle;
  }

  Future<int> getmonthBottle(List<QueryDocumentSnapshot<Map<String, dynamic>>> monthBottle)async{
    int totalBottle = 0;
    DateTime datenow = DateTime.now();
    for(var doc in monthBottle){
        Map<String, dynamic> data = doc.data();
        if(data["Action"] =="ScanQr"){
          if(data["Date"]!= null ){
          
          DateTime activityDate = (data["Date"] as Timestamp).toDate();

          bool isMonth = activityDate.year == datenow.year &&
                     activityDate.month == datenow.month;

          if(isMonth){
            
            totalBottle += ( data["Bottles"] as num).toInt();
          }
        }
        }
    }

    return totalBottle;
  }


  Future<void> uploadData(int? bottles, int points, String action, String description,
    String? taskId, String? transactionId) async {
    try {

      if (action == "ScanQr") {
        totalBottles += bottles!;
        totalPoints += points;
        await firestore.doc(user!.uid).collection("Activity").add({
          "Bottles": bottles,
          "Action": action,
          "Points": points,
          "Date": FieldValue.serverTimestamp(),
        });

      
      } else if (action == "Redeem") {
        totalPoints -= points;
        await firestore.doc(user!.uid).collection("Activity").add({
          "Action": action,
          "Points": points,
          "TransactionId": transactionId,
          "Date": FieldValue.serverTimestamp()
        });
      } else if (action == "ClaimedReward") {
        totalPoints += points;
        await firestore.doc(user!.uid).collection("Activity").add({
          "Action": action,
          "Description": description,
          "Points": points,
          "TaskId": taskId,
          "Date": FieldValue.serverTimestamp()
        });
      }

      await firestore.doc(user!.uid).update({
        "Points": totalPoints,
        "Bottles": totalBottles,
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<DocumentSnapshot<Object?>>get getUserData{
    return firestore.doc(user!.uid).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>get  getUserClaimActivity{
    return  firestore.doc(user?.uid).collection("Activity").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getTasks {
    return firestoreTask.snapshots();
  }



}

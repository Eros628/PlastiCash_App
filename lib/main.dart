import 'package:flutter/material.dart';
import 'screens/startup_screen.dart';
import 'screens//home_screen.dart';

void main() {
  runApp(PlastiCashApp());
}

class PlastiCashApp extends StatelessWidget{
  const PlastiCashApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins"))),
        debugShowCheckedModeBanner: false,
        title: "PlastiCash",
        home: StartupScreen()
    );
  }
}

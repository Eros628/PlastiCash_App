import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/startup_screen.dart';
import 'screens//home_screen.dart';
import 'screens/signup_screen.dart';

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
        routes: {
          '/home': (context) => HomePage()
        },
        initialRoute: '/home',

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/startup':
              return PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => StartupScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  }
              );

            case '/login':
              return PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                  );

                  return FadeTransition(
                  opacity: curvedAnimation,
                  child: child,
                  );
                }
               );

            case '/signup':
              return PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear,
                    );

                    return FadeTransition(
                      opacity: curvedAnimation,
                      child: child,
                    );
                  }
              );
            default:
              return MaterialPageRoute(builder: (_) => StartupScreen());
          }
        },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'screens/startup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
      ScreenUtilInit(
        designSize: Size(1080, 2400),
        builder: (context,child) =>PlastiCashApp(),
      )
      );
}


class PlastiCashApp extends StatelessWidget{
  const PlastiCashApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        theme: ThemeData(textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Poppins"))),
        debugShowCheckedModeBanner: false,
        title: "PlastiCash",
        /*routes: {
           '/home': (context) => HomePage()
        },
        */
        initialRoute: '/startup',

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/startup':
              return PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => StreamBuilder(stream: FirebaseAuth.instance.authStateChanges() , builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(snapshot.data!= null){
                      return const HomePage();
                    }
                    return const StartupScreen();
                  }),
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
            case '/loginstart':
              return PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => LoginStart(),
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

            case '/home':
              return PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 800),
                  reverseTransitionDuration: Duration(milliseconds: 800), // <-- Add this line!
                  pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_finalprojects/screens/startup_screen.dart'; // Replace with actual path


void main() {
  testWidgets('StartupScreen renders properly and all widgets exist', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690), // set your base design size
        minTextAdapt: true,
        builder: (_, __) => MaterialApp(
          home: const StartupScreen(),
          routes: {
            '/loginstart': (_) => const Placeholder(), // stub for navigation
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Now screenutil .h, .w, .sp will work
    expect(find.text('Welcome to PlastiCash'), findsOneWidget);
    expect(find.text('GET STARTED'), findsOneWidget);
  });
}
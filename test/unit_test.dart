import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_finalprojects/screens/home/home_screen.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async  {
  testWidgets('Test navigation and state changes', (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Ensure initial screen is the Home screen (index 0)
    expect(find.text('Good Morning,'), findsOneWidget);

    // Tap on the map icon in the bottom navigation
    await tester.tap(find.byIcon(Icons.pin_drop_outlined));
    await tester.pumpAndSettle();

    // Verify that the map screen is displayed
    expect(find.text('Suggested Location'), findsOneWidget);

    // Tap on the Profile icon in the bottom navigation
    await tester.tap(find.byIcon(Icons.person_2_rounded));
    await tester.pumpAndSettle();

    // Verify that Profile screen is displayed
    expect(find.text('Profile'), findsOneWidget);

    // Tap on the notification icon
    await tester.tap(find.byIcon(Icons.notifications));
    await tester.pumpAndSettle();

    // Optional: Verify state change (e.g., icon color)
    final homeIcon = tester.widget<Icon>(find.byIcon(Icons.home));
    expect(homeIcon.color, equals(Colors.white)); // Update this color to match your theme
  });

  return testMain();
}

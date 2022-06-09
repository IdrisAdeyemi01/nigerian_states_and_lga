// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Check the performance of the DropdownButton',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    //Find 3 DropdownButton
    expect(find.byType(DropdownButton<String>), findsNWidgets(3));
    expect(
        find.widgetWithText(DropdownButton<String>, 'Lagos'), findsOneWidget);

    //Checking for a Local government after tapping on a state
    final statesDropdown =
        find.byKey(const ValueKey('States')); //Finds the States DropdownButton
    await tester.tap(statesDropdown); //Clicks on it
    await tester.pumpAndSettle();

    //Finds the states and click on Abia
    final abiaItem = find.widgetWithText(DropdownMenuItem<String>, 'Abia').last;
    await tester.tap(abiaItem);
    await tester.pumpAndSettle();

    //Search for a Local government in Abia
    expect(find.text("Aba North"), findsNWidgets(2));
  });
}

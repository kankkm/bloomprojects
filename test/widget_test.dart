import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_estate/main.dart';  // Make sure this matches your package name

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app starts correctly
    expect(find.text('Bloom Project'), findsOneWidget);
  });
}
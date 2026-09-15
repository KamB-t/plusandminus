// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:plusandminus/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    final counter = find.byKey(const Key('counter-value'));
    expect(tester.widget<Text>(counter).data, '0');

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(tester.widget<Text>(counter).data, '1');
  });

  testWidgets('Counter decrements', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final counter = find.byKey(const Key('counter-value'));
    expect(tester.widget<Text>(counter).data, '0');

    // Increment twice so we can verify decrementing without going negative.
    await tester.tap(find.byKey(const Key('increment-button')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('increment-button')));
    await tester.pump();
    expect(tester.widget<Text>(counter).data, '2');

    // Tap the '-' button and trigger a frame.
    await tester.tap(find.byKey(const Key('decrement-button')));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(tester.widget<Text>(counter).data, '1');
  });

  testWidgets('Counter resets to zero', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final counter = find.byKey(const Key('counter-value'));

    // Increment a few times so there's something to reset.
    await tester.tap(find.byKey(const Key('increment-button')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('increment-button')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('increment-button')));
    await tester.pump();
    expect(tester.widget<Text>(counter).data, '3');

    // Tap the '0' reset button and trigger a frame.
    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    // Verify that our counter has reset to zero.
    expect(tester.widget<Text>(counter).data, '0');
  });
}

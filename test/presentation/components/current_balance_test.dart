import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:n26/presentation/components/current_balance.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  testWidgets('Flutter Current Balance Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const CurrentBalance()));

    final Finder textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);
    expect(text.data, 'Current Balance');
    expect(text.style?.fontSize, 15.0);
    expect(text.style?.color, const Color(0xFF838383));
  });
}

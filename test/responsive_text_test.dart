import 'package:flutter/material.dart';
import 'package:flutter_responsive_kit/widgets/responsive_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ResponsiveText adjusts font size within range', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ResponsiveText(
            'Test Text',
            minFontSize: 12,
            maxFontSize: 24,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('Test Text'));
    expect(textWidget.style!.fontSize! >= 12, true);
    expect(textWidget.style!.fontSize! <= 24, true);
  });
}

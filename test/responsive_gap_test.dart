import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_responsive_kit/widgets/responsive_gap.dart';

Widget wrapWithMediaQuery({
  required Widget child,
  required Size size,
}) {
  return MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(size: size),
      child: Scaffold(body: child),
    ),
  );
}

void main() {
  group('ResponsiveGap Widget Tests', () {
    testWidgets('Mobile screen - vertical gap', (tester) async {
      await tester.pumpWidget(
        wrapWithMediaQuery(
          size: const Size(400, 800), // mobile
          child: const ResponsiveGap(
            mobile: 10,
            tablet: 20,
            desktop: 30,
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 10);
      expect(sizedBox.width, isNull);
    });

    testWidgets('Tablet screen - vertical gap', (tester) async {
      await tester.pumpWidget(
        wrapWithMediaQuery(
          size: const Size(800, 800), // tablet
          child: const ResponsiveGap(
            mobile: 10,
            tablet: 20,
            desktop: 30,
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 20);
      expect(sizedBox.width, isNull);
    });

    testWidgets('Desktop screen - vertical gap', (tester) async {
      await tester.pumpWidget(
        wrapWithMediaQuery(
          size: const Size(1300, 800), // desktop
          child: const ResponsiveGap(
            mobile: 10,
            tablet: 20,
            desktop: 30,
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 30);
      expect(sizedBox.width, isNull);
    });

    testWidgets('Desktop screen fallback to tablet when desktop not provided',
        (tester) async {
      await tester.pumpWidget(
        wrapWithMediaQuery(
          size: const Size(1300, 800), // desktop
          child: const ResponsiveGap(
            mobile: 10,
            tablet: 20,
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 20);
    });

    testWidgets('Tablet screen fallback to mobile when tablet not provided',
        (tester) async {
      await tester.pumpWidget(
        wrapWithMediaQuery(
          size: const Size(800, 800), // tablet
          child: const ResponsiveGap(
            mobile: 10,
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 10);
    });

    testWidgets('Horizontal direction gap', (tester) async {
      await tester.pumpWidget(
        wrapWithMediaQuery(
          size: const Size(400, 800), // mobile
          child: const ResponsiveGap(
            mobile: 15,
            direction: Axis.horizontal,
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 15);
      expect(sizedBox.height, isNull);
    });
  });
}

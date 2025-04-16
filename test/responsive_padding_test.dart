import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_responsive_kit/widgets/responsive_padding.dart';
import 'package:flutter_responsive_kit/utils/responsive_utils.dart';

void main() {
  // Helper function to create a testable widget with given screen size
  Widget createTestWidget({
    required Widget child,
    required EdgeInsets mobilePadding,
    EdgeInsets? tabletPadding,
    EdgeInsets? desktopPadding,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: ResponsivePadding(
          child: child,
          mobile: mobilePadding,
          tablet: tabletPadding,
          desktop: desktopPadding,
        ),
      ),
    );
  }

  group('ResponsivePadding Widget Tests', () {
    testWidgets('Mobile screen padding', (WidgetTester tester) async {
      // Mock mobile screen size
      tester.binding.window.physicalSizeTestValue =
          Size(375, 667); // Typical mobile size

      // Build the widget
      await tester.pumpWidget(createTestWidget(
        child: const Text('Test'),
        mobilePadding: EdgeInsets.all(10),
        tabletPadding: EdgeInsets.all(20),
        desktopPadding: EdgeInsets.all(30),
      ));

      // Verify that the padding applied is for mobile
      final padding = tester.firstWidget(find.byType(Padding)) as Padding;
      expect(padding.padding, equals(EdgeInsets.all(10)));
    });

    testWidgets('Tablet screen padding', (WidgetTester tester) async {
      // Mock tablet screen size
      tester.binding.window.physicalSizeTestValue =
          Size(768, 1024); // Typical tablet size

      // Build the widget
      await tester.pumpWidget(createTestWidget(
        child: const Text('Test'),
        mobilePadding: EdgeInsets.all(10),
        tabletPadding: EdgeInsets.all(20),
        desktopPadding: EdgeInsets.all(30),
      ));

      // Verify that the padding applied is for tablet
      final padding = tester.firstWidget(find.byType(Padding)) as Padding;
      expect(padding.padding, equals(EdgeInsets.all(20)));
    });

    testWidgets('Desktop screen padding', (WidgetTester tester) async {
      // Mock desktop screen size
      tester.binding.window.physicalSizeTestValue =
          Size(1200, 800); // Typical desktop size

      // Build the widget
      await tester.pumpWidget(createTestWidget(
        child: const Text('Test'),
        mobilePadding: EdgeInsets.all(10),
        tabletPadding: EdgeInsets.all(20),
        desktopPadding: EdgeInsets.all(30),
      ));

      // Verify that the padding applied is for desktop
      final padding = tester.firstWidget(find.byType(Padding)) as Padding;
      expect(padding.padding, equals(EdgeInsets.all(30)));
    });

    testWidgets('ResponsivePadding fallback to mobile padding',
        (WidgetTester tester) async {
      // Mock a screen size smaller than tablet (mobile)
      tester.binding.window.physicalSizeTestValue =
          Size(320, 568); // Small mobile size

      // Build the widget
      await tester.pumpWidget(createTestWidget(
        child: const Text('Test'),
        mobilePadding: EdgeInsets.all(10),
        tabletPadding: EdgeInsets.all(20),
        desktopPadding: EdgeInsets.all(30),
      ));

      // Verify that the padding applied is for mobile
      final padding = tester.firstWidget(find.byType(Padding)) as Padding;
      expect(padding.padding, equals(EdgeInsets.all(10)));
    });
  });
}

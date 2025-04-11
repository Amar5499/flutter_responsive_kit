import 'package:flutter/material.dart';
import 'package:flutter_responsive_kit/widgets/responsive_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ResponsiveBuilder shows mobile view on small screen',
      (tester) async {
    const mobileText = 'Mobile View';

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(500, 800)),
        child: MaterialApp(
          home: ResponsiveBuilder(
            mobile: (_) => const Text(mobileText),
            tablet: (_) => const Text('Tablet View'),
            desktop: (_) => const Text('Desktop View'),
          ),
        ),
      ),
    );

    expect(find.text(mobileText), findsOneWidget);
  });

  testWidgets('ResponsiveBuilder shows desktop view on wide screen',
      (tester) async {
    const desktopText = 'Desktop View';

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1200, 800)),
        child: MaterialApp(
          home: ResponsiveBuilder(
            mobile: (_) => const Text('Mobile View'),
            tablet: (_) => const Text('Tablet View'),
            desktop: (_) => const Text(desktopText),
          ),
        ),
      ),
    );

    expect(find.text(desktopText), findsOneWidget);
  });
}

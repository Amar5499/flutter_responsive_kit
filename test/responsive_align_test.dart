import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_responsive_kit/widgets/responsive_align.dart';

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
  testWidgets('ResponsiveAlign uses mobile alignment', (tester) async {
    await tester.pumpWidget(
      wrapWithMediaQuery(
        size: const Size(400, 800), // < 600 → mobile
        child: const ResponsiveAlign(
          child: Text('Mobile'),
          mobile: Alignment.topLeft,
          tablet: Alignment.center,
          desktop: Alignment.bottomRight,
        ),
      ),
    );

    final align = tester.widget<Align>(find.byType(Align));
    expect(align.alignment, Alignment.topLeft);
  });

  testWidgets('ResponsiveAlign uses tablet alignment', (tester) async {
    await tester.pumpWidget(
      wrapWithMediaQuery(
        size: const Size(800, 800), // 600–1024 → tablet
        child: const ResponsiveAlign(
          child: Text('Tablet'),
          mobile: Alignment.topLeft,
          tablet: Alignment.center,
          desktop: Alignment.bottomRight,
        ),
      ),
    );

    final align = tester.widget<Align>(find.byType(Align));
    expect(align.alignment, Alignment.center);
  });

  testWidgets('ResponsiveAlign uses desktop alignment', (tester) async {
    await tester.pumpWidget(
      wrapWithMediaQuery(
        size: const Size(1300, 800), // ≥ 1024 → desktop
        child: const ResponsiveAlign(
          child: Text('Desktop'),
          mobile: Alignment.topLeft,
          tablet: Alignment.center,
          desktop: Alignment.bottomRight,
        ),
      ),
    );

    final align = tester.widget<Align>(find.byType(Align));
    expect(align.alignment, Alignment.bottomRight);
  });

  testWidgets(
      'ResponsiveAlign falls back to mobile when tablet/desktop not given',
      (tester) async {
    await tester.pumpWidget(
      wrapWithMediaQuery(
        size: const Size(1300, 800), // desktop
        child: const ResponsiveAlign(
          child: Text('Fallback'),
          mobile: Alignment.topLeft,
        ),
      ),
    );

    final align = tester.widget<Align>(find.byType(Align));
    expect(align.alignment, Alignment.topLeft); // fallback from mobile
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_responsive_kit/utils/responsive_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ResponsiveUtils detects screen sizes correctly', (tester) async {
    const testKey = Key('test');

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(500, 800)), // Mobile
        child: Builder(
          builder: (context) {
            final isMobile = ResponsiveUtils.isMobile(context);
            final isTablet = ResponsiveUtils.isTablet(context);
            final isDesktop = ResponsiveUtils.isDesktop(context);

            expect(isMobile, true);
            expect(isTablet, false);
            expect(isDesktop, false);

            return const SizedBox(key: testKey);
          },
        ),
      ),
    );
  });
}

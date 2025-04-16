import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

/// A widget that adds responsive margin based on screen size.
class ResponsiveMargin extends StatelessWidget {
  final Widget child;
  final double mobile;
  final double? tablet;
  final double? desktop;

  const ResponsiveMargin({
    super.key,
    required this.child,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final margin = ResponsiveUtils.isDesktop(context)
        ? (desktop ?? tablet ?? mobile)
        : ResponsiveUtils.isTablet(context)
            ? (tablet ?? mobile)
            : mobile;

    return Container(
      margin: EdgeInsets.all(margin),
      child: child,
    );
  }
}

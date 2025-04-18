import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

/// A widget that adds responsive padding based on screen size.
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final double mobile;
  final double? tablet;
  final double? desktop;

  const ResponsivePadding({
    super.key,
    required this.child,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveUtils.isDesktop(context)
        ? (desktop ?? tablet ?? mobile)
        : ResponsiveUtils.isTablet(context)
            ? (tablet ?? mobile)
            : mobile;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}

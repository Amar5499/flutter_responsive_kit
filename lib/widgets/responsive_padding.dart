import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

/// A widget that adds responsive padding based on screen size.
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets mobile;
  final EdgeInsets? tablet;
  final EdgeInsets? desktop;

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
      padding: padding,
      child: child,
    );
  }
}

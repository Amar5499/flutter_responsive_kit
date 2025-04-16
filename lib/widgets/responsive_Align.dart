import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

/// A widget that provides responsive alignment based on screen size.
class ResponsiveAlign extends StatelessWidget {
  final Widget child;
  final Alignment mobile;
  final Alignment? tablet;
  final Alignment? desktop;

  const ResponsiveAlign({
    super.key,
    required this.child,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = ResponsiveUtils.isDesktop(context)
        ? (desktop ?? tablet ?? mobile)
        : ResponsiveUtils.isTablet(context)
            ? (tablet ?? mobile)
            : mobile;

    return Align(
      alignment: alignment,
      child: child,
    );
  }
}

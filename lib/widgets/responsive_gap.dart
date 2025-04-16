import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

/// A responsive gap (empty space) widget that changes its size depending on the screen.
class ResponsiveGap extends StatelessWidget {
  final double mobile;
  final double? tablet;
  final double? desktop;
  final Axis direction;

  const ResponsiveGap({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final size = ResponsiveUtils.isDesktop(context)
        ? (desktop ?? tablet ?? mobile)
        : ResponsiveUtils.isTablet(context)
            ? (tablet ?? mobile)
            : mobile;

    return direction == Axis.horizontal
        ? SizedBox(width: size)
        : SizedBox(height: size);
  }
}

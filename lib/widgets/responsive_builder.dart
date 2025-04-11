import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

typedef ResponsiveWidgetBuilder = Widget Function(BuildContext context);

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder mobile;
  final ResponsiveWidgetBuilder? tablet;
  final ResponsiveWidgetBuilder? desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024 && desktop != null) {
      return desktop!(context);
    } else if (width >= 600 && tablet != null) {
      return tablet!(context);
    } else {
      return mobile(context);
    }
  }
}

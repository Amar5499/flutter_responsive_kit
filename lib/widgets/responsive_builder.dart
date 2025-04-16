import 'package:flutter/material.dart';

/// A typedef that represents a widget builder function
/// which provides a [BuildContext].
typedef ResponsiveWidgetBuilder = Widget Function(BuildContext context);

/// A responsive widget builder that renders different widgets
/// based on the screen width.
///
/// It allows you to provide separate widgets for mobile, tablet, and desktop
/// views, and automatically selects the appropriate one based on the current
/// screen size.
class ResponsiveBuilder extends StatelessWidget {
  /// The widget builder for mobile layout.
  final ResponsiveWidgetBuilder mobile;

  /// The optional widget builder for tablet layout.
  final ResponsiveWidgetBuilder? tablet;

  /// The optional widget builder for desktop layout.
  final ResponsiveWidgetBuilder? desktop;

  /// Creates a [ResponsiveBuilder] with required [mobile] layout and optional
  /// [tablet] and [desktop] layouts.
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

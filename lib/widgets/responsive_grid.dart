import 'package:flutter/material.dart';

/// A responsive horizontal container that wraps its children widgets.
///
/// It uses Flutter's [Wrap] widget with spacing and run spacing to allow
/// widgets to wrap onto multiple lines when needed.
class ResponsiveRow extends StatelessWidget {
  /// The list of child widgets to display in the row.
  final List<Widget> children;

  /// Creates a [ResponsiveRow] with the given [children].
  const ResponsiveRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: children,
    );
  }
}

/// A responsive column widget that adjusts its width based on screen size.
///
/// You can define how many columns (out of 12) this widget should take up
/// on mobile ([xs]), tablet ([md]), and desktop ([lg]) screens.
class ResponsiveCol extends StatelessWidget {
  /// Number of columns to occupy on extra small screens (mobile).
  final int xs;

  /// Number of columns to occupy on medium screens (tablet).
  final int? md;

  /// Number of columns to occupy on large screens (desktop).
  final int? lg;

  /// The child widget to be displayed inside the column.
  final Widget child;

  /// Creates a [ResponsiveCol] widget with required column spans and child.
  const ResponsiveCol({
    super.key,
    required this.xs,
    this.md,
    this.lg,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int flex = xs;

    if (width >= 1024 && lg != null) {
      flex = lg!;
    } else if (width >= 600 && md != null) {
      flex = md!;
    }

    return SizedBox(
      width: (flex / 12) * MediaQuery.of(context).size.width,
      child: child,
    );
  }
}

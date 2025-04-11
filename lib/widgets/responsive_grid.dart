import 'package:flutter/material.dart';

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;

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

class ResponsiveCol extends StatelessWidget {
  final int xs; // mobile
  final int? md; // tablet
  final int? lg; // desktop
  final Widget child;

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

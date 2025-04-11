import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final TextStyle? style;
  final TextAlign? textAlign;

  const ResponsiveText(
    this.text, {
    super.key,
    this.minFontSize = 12,
    this.maxFontSize = 24,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 24;

    fontSize = fontSize.clamp(minFontSize, maxFontSize);

    return Text(
      text,
      textAlign: textAlign,
      style:
          style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
    );
  }
}

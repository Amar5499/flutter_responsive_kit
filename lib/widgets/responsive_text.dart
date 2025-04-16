import 'package:flutter/material.dart';

/// A responsive [Text] widget that automatically adjusts its font size
/// based on the screen width.
///
/// This is useful for making text readable across mobile, tablet,
/// and desktop devices without manually defining breakpoints.
class ResponsiveText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The minimum font size allowed regardless of screen width.
  final double minFontSize;

  /// The maximum font size allowed regardless of screen width.
  final double maxFontSize;

  /// Optional style to apply to the text. The font size will be overridden.
  final TextStyle? style;

  /// Optional alignment for the text.
  final TextAlign? textAlign;

  /// Creates a [ResponsiveText] widget.
  ///
  /// - [text] is required.
  /// - [minFontSize] and [maxFontSize] determine the scaling range.
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

    // Estimate font size based on screen width and clamp it.
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

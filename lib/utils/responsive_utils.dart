import 'package:flutter/material.dart';

/// A utility class that provides methods to determine the type of device
/// based on the screen width and to retrieve screen dimensions.
class ResponsiveUtils {
  /// Returns `true` if the device screen width is less than 600 pixels,
  /// typically considered a mobile device.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  /// Returns `true` if the device screen width is between 600 and 1024 pixels,
  /// typically considered a tablet device.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  /// Returns `true` if the device screen width is 1024 pixels or more,
  /// typically considered a desktop device.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  /// Returns the width of the current screen.
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Returns the height of the current screen.
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

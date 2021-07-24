import 'package:flutter/material.dart';

/// Removes the material glow behaviour that is default for
/// overscroll on Android
class ScrollWithoutMaterialOverflowGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
class ThemeConfig {

  static const AppBarBackground = Color.fromRGBO(255,108,108,1.0);
  static const darker = const Color(0xff5353);
  static const lighter = const Color(0xff8686);
  static const paleyellow = const Color(0xffeaa7);
  static const dribble = const Color(0xFF6C6C);
  static const themegreen = const Color(0x87B199);
  static const themeblue = const Color(0x6D9DF1);

}
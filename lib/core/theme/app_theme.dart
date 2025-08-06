import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class Themes {
  static ThemeData get theme => ThemeData.light();
  static ThemeData get darkTheme => ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black);
}

import 'package:flutter/material.dart';
import 'package:user/user_theme/text_theme.dart';
import 'package:user/user_theme/user_app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      textTheme: AppThemeText.getTextTheme(),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      primaryColor: PrimaryColor,
      scaffoldBackgroundColor: Colors.white);
}

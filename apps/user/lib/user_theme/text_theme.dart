import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeText {
  const AppThemeText._();

  static TextStyle get _labelLarge =>
      const TextStyle(fontSize: 22, color: Colors.grey);

  static TextStyle get _labelMedium =>
      const TextStyle(fontSize: 18, color: Colors.grey);

  static TextStyle get _labelSmall => const TextStyle(
      fontSize: 14,
      color: Colors.grey,
      fontWeight: FontWeight.w100,
      letterSpacing: 0.8);

  static TextStyle get labelMediumUnderline => TextStyle(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontSize: 14,
      decoration: TextDecoration.underline);

  static TextStyle get _displayLarge => const TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87);

  static TextStyle get _displayMedium => const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87);

  static TextStyle get _displaySmall => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

  static TextStyle get _bodySmall =>
      const TextStyle(fontSize: 14, color: Colors.black38);

  static getTextTheme() => TextTheme(
      displayLarge: _displayLarge,
      displayMedium: _displayMedium,
      labelLarge: _labelLarge,
      labelMedium: _labelMedium,
      labelSmall: _labelSmall,
      bodySmall: _bodySmall,
      displaySmall: _displaySmall);
}

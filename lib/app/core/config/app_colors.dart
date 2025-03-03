import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFFC1272D);
  static const Color secondary = Color(0xFFE6A6A9);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  ///Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xfff8f5f7),
      Color(0xFFebbcbe),

    ],
  );



  // Text Colors
  static const Color textPrimary = Color(0xFF1C1C1C);
  static const Color textSecondary = Color(0xFF7B7B7B);
  static const Color textWhite = Colors.white;


  // Background Colors
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFFFFFFF);
  static const Color appBarTextColor= Color(0xFF212121);

  // Surface Colors
  static const Color surfaceLight = Color(0xFFE0E0E0);
  static const Color surfaceDark = Color(0xFF2C2C2C);

  // Container Colors
  static const Color lightContainer = Color(0xFFF1F8E9);

  // Utility Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF29B6F6);
}
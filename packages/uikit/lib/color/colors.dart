import 'package:flutter/material.dart';


class ThemeConstants {
  // Colors
  static const primaryLight = Color(0xFF1976D2);
  static const primaryDark = Color(0xFF42A5F5);
  
  static const secondaryLight = Color(0xFF03DAC6);
  static const secondaryDark = Color(0xFF018786);
  
  static const backgroundLight = Color(0xFFFFFFFF);
  static const backgroundDark = Color(0xFF121212);
  
  static const surfaceLight = Color(0xFFF5F5F5);
  static const surfaceDark = Color(0xFF1E1E1E);
  
  // Typography
  static const fontFamily = 'SF Pro Display'; // или ваш шрифт
  
  // Spacing
  static const spacing4 = 4.0;
  static const spacing8 = 8.0;
  static const spacing12 = 12.0;
  static const spacing16 = 16.0;
  static const spacing20 = 20.0;
  static const spacing24 = 24.0;
  static const spacing32 = 32.0;
  
  // Border radius
  static const radiusSmall = 8.0;
  static const radiusMedium = 12.0;
  static const radiusLarge = 16.0;
  static const radiusXLarge = 24.0;
  
  // Shadows
  static const shadowElevation1 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      color: Color(0x1A000000),
    ),
  ];
  
}
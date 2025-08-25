import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import '../color/colors.dart';
import '../fonts/typography.dart';

part 'app_theme.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  const AppTheme({
    // Colors
    required this.primary,
    required this.primaryVariant,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onBackground,
    required this.onSurface,
    required this.onError,
    
    // Text colors
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    
    // Typography
    required this.headlineFont,
    required this.bodyFont,
    
    // Text styles
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.caption,
    required this.overline,
    
    // Component specific
    required this.cardBackground,
    required this.dividerColor,
    required this.shadowColor,
    
    // Dimensions
    required this.borderRadiusSmall,
    required this.borderRadiusMedium,
    required this.borderRadiusLarge,
    
    // Shadows
    required this.shadowElevation1,
    required this.shadowElevation2,
  });

  // Colors
  @override
  final Color primary;
  @override
  final Color primaryVariant;
  @override
  final Color secondary;
  @override
  final Color background;
  @override
  final Color surface;
  @override
  final Color error;
  @override
  final Color onPrimary;
  @override
  final Color onSecondary;
  @override
  final Color onBackground;
  @override
  final Color onSurface;
  @override
  final Color onError;

  // Text colors
  @override
  final Color textPrimary;
  @override
  final Color textSecondary;
  @override
  final Color textDisabled;

  // Typography
  @override
  final String headlineFont;
  @override
  final String bodyFont;

  // Text styles
  @override
  final TextStyle h1;
  @override
  final TextStyle h2;
  @override
  final TextStyle h3;
  @override
  final TextStyle h4;
  @override
  final TextStyle h5;
  @override
  final TextStyle h6;
  @override
  final TextStyle bodyLarge;
  @override
  final TextStyle bodyMedium;
  @override
  final TextStyle bodySmall;
  @override
  final TextStyle caption;
  @override
  final TextStyle overline;

  // Component specific
  @override
  final Color cardBackground;
  @override
  final Color dividerColor;
  @override
  final Color shadowColor;

  // Dimensions
  @override
  final double borderRadiusSmall;
  @override
  final double borderRadiusMedium;
  @override
  final double borderRadiusLarge;

  // Shadows
  @override
  final List<BoxShadow> shadowElevation1;
  @override
  final List<BoxShadow> shadowElevation2;

  static const light = AppTheme(
    // Colors
    primary: ThemeConstants.primaryLight,
    primaryVariant: Color(0xFF1565C0),
    secondary: ThemeConstants.secondaryLight,
    background: ThemeConstants.backgroundLight,
    surface: ThemeConstants.surfaceLight,
    error: Color(0xFFB00020),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black87,
    onSurface: Colors.black87,
    onError: Colors.white,
    
    // Text colors
    textPrimary: Colors.black87,
    textSecondary: Colors.black54,
    textDisabled: Colors.black38,
    
    // Typography
    
    // Text styles
    h1: TextStyle(
      fontSize: AppTypography.h1,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      letterSpacing: AppTypography.letterSpacingTight,
      color: Colors.black87,
    ),
    h2: TextStyle(
      fontSize: AppTypography.h2,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      color: Colors.black87,
    ),
    h3: TextStyle(
      fontSize: AppTypography.h3,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: Colors.black87,
    ),
    h4: TextStyle(
      fontSize: AppTypography.h4,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: Colors.black87,
    ),
    h5: TextStyle(
      fontSize: AppTypography.h5,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: Colors.black87,
    ),
    h6: TextStyle(
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontSize: AppTypography.bodyLarge,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: AppTypography.bodyMedium,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: Colors.black54,
    ),
    bodySmall: TextStyle(
      fontSize: AppTypography.bodySmall,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightNormal,
      color: Colors.black54,
    ),
    caption: TextStyle(
      fontSize: AppTypography.caption,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    overline: TextStyle(
      fontSize: AppTypography.overline,
      fontWeight: FontWeight.w500,
      letterSpacing: AppTypography.letterSpacingWide,
      color: Colors.black54,
    ),
    
    // Components
    cardBackground: Colors.white,
    dividerColor: Color(0xFFE0E0E0),
    shadowColor: Colors.black26,
    
    // Dimensions
    borderRadiusSmall: ThemeConstants.radiusSmall,
    borderRadiusMedium: ThemeConstants.radiusMedium,
    borderRadiusLarge: ThemeConstants.radiusLarge, headlineFont: '', bodyFont: '', shadowElevation1: [], shadowElevation2: [],
    

  );

  static const dark = AppTheme(
    // Colors
    primary: ThemeConstants.primaryDark,
    primaryVariant: Color(0xFF1E88E5),
    secondary: ThemeConstants.secondaryDark,
    background: ThemeConstants.backgroundDark,
    surface: ThemeConstants.surfaceDark,
    error: Color(0xFFCF6679),
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white,
    onError: Colors.black,
    
    // Text colors
    textPrimary: Colors.white,
    textSecondary: Colors.white70,
    textDisabled: Colors.white38,
    
    // Typography
    
    // Text styles (тёмная тема)
    h1: TextStyle(
      fontSize: AppTypography.h1,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      letterSpacing: AppTypography.letterSpacingTight,
      color: Colors.white,
    ),
    h2: TextStyle(
      fontSize: AppTypography.h2,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      color: Colors.white,
    ),
    h3: TextStyle(
      fontSize: AppTypography.h3,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: Colors.white,
    ),
    h4: TextStyle(
      fontSize: AppTypography.h4,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: Colors.white,
    ),
    h5: TextStyle(
      fontSize: AppTypography.h5,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: Colors.white,
    ),
    h6: TextStyle(
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: AppTypography.bodyLarge,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: AppTypography.bodyMedium,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: Colors.white70,
    ),
    bodySmall: TextStyle(
      fontSize: AppTypography.bodySmall,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightNormal,
      color: Colors.white70,
    ),
    caption: TextStyle(
      fontSize: AppTypography.caption,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
    ),
    overline: TextStyle(
      fontSize: AppTypography.overline,
      fontWeight: FontWeight.w500,
      letterSpacing: AppTypography.letterSpacingWide,
      color: Colors.white70,
    ),
    
    // Components
    cardBackground: Color(0xFF2C2C2C),
    dividerColor: Color(0xFF424242),
    shadowColor: Colors.black54,
    
    // Dimensions
    borderRadiusSmall: ThemeConstants.radiusSmall,
    borderRadiusMedium: ThemeConstants.radiusMedium,
    borderRadiusLarge: ThemeConstants.radiusLarge,
    
    // Shadows
    shadowElevation1: ThemeConstants.shadowElevation1, headlineFont: '', bodyFont: '', shadowElevation2: [],

  );
}

extension AppThemeExtension on AppTheme {
  List<MapEntry<String, Color>> get colorEntries => [
    MapEntry('primary', primary),
    MapEntry('secondary', secondary),
    MapEntry('background', background),
    MapEntry('surface', surface),
    MapEntry('error', error),
    MapEntry('onPrimary', onPrimary),
    MapEntry('onSecondary', onSecondary),
    MapEntry('onBackground', onBackground),
    MapEntry('onSurface', onSurface),
    MapEntry('onError', onError),
    MapEntry('textPrimary', textPrimary),
    MapEntry('textSecondary', textSecondary),
    MapEntry('textDisabled', textDisabled),
  ];
  
  List<MapEntry<String, TextStyle>> get textStyleEntries => [
    MapEntry('h1', h1),
    MapEntry('h2', h2),
    MapEntry('h3', h3),
    MapEntry('h4', h4),
    MapEntry('h5', h5),
    MapEntry('h6', h6),
    MapEntry('bodyLarge', bodyLarge),
    MapEntry('bodyMedium', bodyMedium),
    MapEntry('bodySmall', bodySmall),
    MapEntry('caption', caption),
    MapEntry('overline', overline),
  ];
}
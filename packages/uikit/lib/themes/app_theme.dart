import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:uikit/layout/app_size.dart';
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
    // Colors - четкие контрастные цвета
    primary: ThemeConstants.primaryLight,
    primaryVariant: Color(0xFF1E40AF), // Темнее основного
    secondary: ThemeConstants.secondaryLight,
    background: ThemeConstants.backgroundLight,
    surface: ThemeConstants.surfaceLight,
    error: ThemeConstants.errorLight,

    // Контрастные цвета - четкие
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: ThemeConstants.textPrimaryLight,
    onSurface: ThemeConstants.textPrimaryLight,
    onError: Colors.white,

    // Text colors - максимальный контраст
    textPrimary: ThemeConstants.textPrimaryLight,
    textSecondary: ThemeConstants.textSecondaryLight,
    textDisabled: ThemeConstants.textDisabledLight,

    // Typography
    headlineFont: ThemeConstants.fontFamily,
    bodyFont: ThemeConstants.fontFamilyBody,

    // Text styles - четкая иерархия
    h1: TextStyle(
      fontSize: AppTypography.h1,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      letterSpacing: AppTypography.letterSpacingTight,
      color: ThemeConstants.textPrimaryLight, // Черный
    ),
    h2: TextStyle(
      fontSize: AppTypography.h2,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      color: ThemeConstants.textPrimaryLight, // Черный
    ),
    h3: TextStyle(
      fontSize: AppTypography.h3,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.gray700, // Темно-серый - контрастный
    ),
    h4: TextStyle(
      fontSize: AppTypography.h4,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.gray700, // Темно-серый
    ),
    h5: TextStyle(
      fontSize: AppTypography.h5,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.gray600, // Средне-серый
    ),
    h6: TextStyle(
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.textPrimaryLight, // Средне-серый
    ),
    bodyLarge: TextStyle(
      fontSize: AppTypography.bodyLarge,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: ThemeConstants.textPrimaryLight, // Основной черный текст
    ),
    bodyMedium: TextStyle(
      fontSize: AppTypography.bodyMedium,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: ThemeConstants.textSecondaryLight, // Серый - но читаемый
    ),
    bodySmall: TextStyle(
      fontSize: AppTypography.bodySmall,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.textSecondaryLight,
    ),
    caption: TextStyle(
      fontSize: AppTypography.caption,
      fontWeight: FontWeight.normal,
      color: ThemeConstants.textDisabledLight, // Светло-серый
    ),
    overline: TextStyle(
      fontSize: AppTypography.overline,
      fontWeight: FontWeight.w500,
      letterSpacing: AppTypography.letterSpacingWide,
      color: ThemeConstants.textDisabledLight,
    ),

    // Components - контрастные
    cardBackground: ThemeConstants.cardBackgroundLight,
    dividerColor: ThemeConstants.dividerColorLight,
    shadowColor: ThemeConstants.shadowColorLight,

    // Dimensions
    borderRadiusSmall: AppSizes.radiusSmall,
    borderRadiusMedium: AppSizes.radiusMedium,
    borderRadiusLarge: AppSizes.radiusLarge,

    // Shadows
    shadowElevation1: ThemeConstants.shadowElevation1,
    shadowElevation2: ThemeConstants.shadowElevation2,
  );

  static const dark = AppTheme(
    // Colors - яркие для темной темы
    primary: ThemeConstants.primaryDark,
    primaryVariant: Color(0xFF3B82F6), // Ярче основного
    secondary: ThemeConstants.secondaryDark,
    background: ThemeConstants.backgroundDark,
    surface: ThemeConstants.surfaceDark,
    error: ThemeConstants.errorDark,

    // Контрастные цвета для темной темы
    onPrimary: ThemeConstants.backgroundDark, // Темный текст на ярком фоне
    onSecondary: ThemeConstants.backgroundDark,
    onBackground: ThemeConstants.textPrimaryDark,
    onSurface: ThemeConstants.textPrimaryDark,
    onError: ThemeConstants.backgroundDark,

    // Text colors - яркие для темного фона
    textPrimary: ThemeConstants.textPrimaryDark,
    textSecondary: ThemeConstants.textSecondaryDark,
    textDisabled: ThemeConstants.textDisabledDark,

    // Typography
    headlineFont: ThemeConstants.fontFamily,
    bodyFont: ThemeConstants.fontFamilyBody,

    // Text styles - яркие цвета для читаемости
    h1: TextStyle(
      fontSize: AppTypography.h1,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      letterSpacing: AppTypography.letterSpacingTight,
      color: ThemeConstants.textPrimaryDark, // Яркий белый
    ),
    h2: TextStyle(
      fontSize: AppTypography.h2,
      fontWeight: FontWeight.bold,
      height: AppTypography.lineHeightTight,
      color: ThemeConstants.textPrimaryDark, // Яркий белый
    ),
    h3: TextStyle(
      fontSize: AppTypography.h3,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.slate200, // Светло-серый - контрастный
    ),
    h4: TextStyle(
      fontSize: AppTypography.h4,
      fontWeight: FontWeight.w600,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.slate200,
    ),
    h5: TextStyle(
      fontSize: AppTypography.h5,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.slate300, // Еще светлее
    ),
    h6: TextStyle(
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w500,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.slate300,
    ),
    bodyLarge: TextStyle(
      fontSize: AppTypography.bodyLarge,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: ThemeConstants.textPrimaryDark, // Основной яркий текст
    ),
    bodyMedium: TextStyle(
      fontSize: AppTypography.bodyMedium,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightRelaxed,
      color: ThemeConstants.textSecondaryDark, // Вторичный - но читаемый
    ),
    bodySmall: TextStyle(
      fontSize: AppTypography.bodySmall,
      fontWeight: FontWeight.normal,
      height: AppTypography.lineHeightNormal,
      color: ThemeConstants.textSecondaryDark,
    ),
    caption: TextStyle(
      fontSize: AppTypography.caption,
      fontWeight: FontWeight.normal,
      color: ThemeConstants.textDisabledDark, // Приглушенный
    ),
    overline: TextStyle(
      fontSize: AppTypography.overline,
      fontWeight: FontWeight.w500,
      letterSpacing: AppTypography.letterSpacingWide,
      color: ThemeConstants.textDisabledDark,
    ),

    // Components - контрастные для темной темы
    cardBackground: ThemeConstants.cardBackgroundDark,
    dividerColor: ThemeConstants.dividerColorDark,
    shadowColor: ThemeConstants.shadowColorDark,

    // Dimensions
    borderRadiusSmall: AppSizes.radiusSmall,
    borderRadiusMedium: AppSizes.radiusMedium,
    borderRadiusLarge: AppSizes.radiusLarge,

    // Shadows - более выраженные для темной темы
    shadowElevation1: ThemeConstants.shadowElevation1Dark,
    shadowElevation2: ThemeConstants.shadowElevation2Dark,
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
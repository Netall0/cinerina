// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeTailorMixin on ThemeExtension<AppTheme> {
  Color get primary;
  Color get primaryVariant;
  Color get secondary;
  Color get background;
  Color get surface;
  Color get error;
  Color get onPrimary;
  Color get onSecondary;
  Color get onBackground;
  Color get onSurface;
  Color get onError;
  Color get textPrimary;
  Color get textSecondary;
  Color get textDisabled;
  String get headlineFont;
  String get bodyFont;
  TextStyle get h1;
  TextStyle get h2;
  TextStyle get h3;
  TextStyle get h4;
  TextStyle get h5;
  TextStyle get h6;
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;
  TextStyle get caption;
  TextStyle get overline;
  Color get cardBackground;
  Color get dividerColor;
  Color get shadowColor;
  double get borderRadiusSmall;
  double get borderRadiusMedium;
  double get borderRadiusLarge;
  List<BoxShadow> get shadowElevation1;
  List<BoxShadow> get shadowElevation2;

  @override
  AppTheme copyWith({
    Color? primary,
    Color? primaryVariant,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onBackground,
    Color? onSurface,
    Color? onError,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    String? headlineFont,
    String? bodyFont,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? h6,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? caption,
    TextStyle? overline,
    Color? cardBackground,
    Color? dividerColor,
    Color? shadowColor,
    double? borderRadiusSmall,
    double? borderRadiusMedium,
    double? borderRadiusLarge,
    List<BoxShadow>? shadowElevation1,
    List<BoxShadow>? shadowElevation2,
  }) {
    return AppTheme(
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      onError: onError ?? this.onError,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      headlineFont: headlineFont ?? this.headlineFont,
      bodyFont: bodyFont ?? this.bodyFont,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      h5: h5 ?? this.h5,
      h6: h6 ?? this.h6,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
      cardBackground: cardBackground ?? this.cardBackground,
      dividerColor: dividerColor ?? this.dividerColor,
      shadowColor: shadowColor ?? this.shadowColor,
      borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
      borderRadiusMedium: borderRadiusMedium ?? this.borderRadiusMedium,
      borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
      shadowElevation1: shadowElevation1 ?? this.shadowElevation1,
      shadowElevation2: shadowElevation2 ?? this.shadowElevation2,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      headlineFont: t < 0.5 ? headlineFont : other.headlineFont,
      bodyFont: t < 0.5 ? bodyFont : other.bodyFont,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      h5: TextStyle.lerp(h5, other.h5, t)!,
      h6: TextStyle.lerp(h6, other.h6, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      borderRadiusSmall: t < 0.5 ? borderRadiusSmall : other.borderRadiusSmall,
      borderRadiusMedium: t < 0.5
          ? borderRadiusMedium
          : other.borderRadiusMedium,
      borderRadiusLarge: t < 0.5 ? borderRadiusLarge : other.borderRadiusLarge,
      shadowElevation1: t < 0.5 ? shadowElevation1 : other.shadowElevation1,
      shadowElevation2: t < 0.5 ? shadowElevation2 : other.shadowElevation2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(
              primaryVariant,
              other.primaryVariant,
            ) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality().equals(
              background,
              other.background,
            ) &&
            const DeepCollectionEquality().equals(surface, other.surface) &&
            const DeepCollectionEquality().equals(error, other.error) &&
            const DeepCollectionEquality().equals(onPrimary, other.onPrimary) &&
            const DeepCollectionEquality().equals(
              onSecondary,
              other.onSecondary,
            ) &&
            const DeepCollectionEquality().equals(
              onBackground,
              other.onBackground,
            ) &&
            const DeepCollectionEquality().equals(onSurface, other.onSurface) &&
            const DeepCollectionEquality().equals(onError, other.onError) &&
            const DeepCollectionEquality().equals(
              textPrimary,
              other.textPrimary,
            ) &&
            const DeepCollectionEquality().equals(
              textSecondary,
              other.textSecondary,
            ) &&
            const DeepCollectionEquality().equals(
              textDisabled,
              other.textDisabled,
            ) &&
            const DeepCollectionEquality().equals(
              headlineFont,
              other.headlineFont,
            ) &&
            const DeepCollectionEquality().equals(bodyFont, other.bodyFont) &&
            const DeepCollectionEquality().equals(h1, other.h1) &&
            const DeepCollectionEquality().equals(h2, other.h2) &&
            const DeepCollectionEquality().equals(h3, other.h3) &&
            const DeepCollectionEquality().equals(h4, other.h4) &&
            const DeepCollectionEquality().equals(h5, other.h5) &&
            const DeepCollectionEquality().equals(h6, other.h6) &&
            const DeepCollectionEquality().equals(bodyLarge, other.bodyLarge) &&
            const DeepCollectionEquality().equals(
              bodyMedium,
              other.bodyMedium,
            ) &&
            const DeepCollectionEquality().equals(bodySmall, other.bodySmall) &&
            const DeepCollectionEquality().equals(caption, other.caption) &&
            const DeepCollectionEquality().equals(overline, other.overline) &&
            const DeepCollectionEquality().equals(
              cardBackground,
              other.cardBackground,
            ) &&
            const DeepCollectionEquality().equals(
              dividerColor,
              other.dividerColor,
            ) &&
            const DeepCollectionEquality().equals(
              shadowColor,
              other.shadowColor,
            ) &&
            const DeepCollectionEquality().equals(
              borderRadiusSmall,
              other.borderRadiusSmall,
            ) &&
            const DeepCollectionEquality().equals(
              borderRadiusMedium,
              other.borderRadiusMedium,
            ) &&
            const DeepCollectionEquality().equals(
              borderRadiusLarge,
              other.borderRadiusLarge,
            ) &&
            const DeepCollectionEquality().equals(
              shadowElevation1,
              other.shadowElevation1,
            ) &&
            const DeepCollectionEquality().equals(
              shadowElevation2,
              other.shadowElevation2,
            ));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(primaryVariant),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(surface),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(onPrimary),
      const DeepCollectionEquality().hash(onSecondary),
      const DeepCollectionEquality().hash(onBackground),
      const DeepCollectionEquality().hash(onSurface),
      const DeepCollectionEquality().hash(onError),
      const DeepCollectionEquality().hash(textPrimary),
      const DeepCollectionEquality().hash(textSecondary),
      const DeepCollectionEquality().hash(textDisabled),
      const DeepCollectionEquality().hash(headlineFont),
      const DeepCollectionEquality().hash(bodyFont),
      const DeepCollectionEquality().hash(h1),
      const DeepCollectionEquality().hash(h2),
      const DeepCollectionEquality().hash(h3),
      const DeepCollectionEquality().hash(h4),
      const DeepCollectionEquality().hash(h5),
      const DeepCollectionEquality().hash(h6),
      const DeepCollectionEquality().hash(bodyLarge),
      const DeepCollectionEquality().hash(bodyMedium),
      const DeepCollectionEquality().hash(bodySmall),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(overline),
      const DeepCollectionEquality().hash(cardBackground),
      const DeepCollectionEquality().hash(dividerColor),
      const DeepCollectionEquality().hash(shadowColor),
      const DeepCollectionEquality().hash(borderRadiusSmall),
      const DeepCollectionEquality().hash(borderRadiusMedium),
      const DeepCollectionEquality().hash(borderRadiusLarge),
      const DeepCollectionEquality().hash(shadowElevation1),
      const DeepCollectionEquality().hash(shadowElevation2),
    ]);
  }
}

extension AppThemeBuildContextProps on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  Color get primary => appTheme.primary;
  Color get primaryVariant => appTheme.primaryVariant;
  Color get secondary => appTheme.secondary;
  Color get background => appTheme.background;
  Color get surface => appTheme.surface;
  Color get error => appTheme.error;
  Color get onPrimary => appTheme.onPrimary;
  Color get onSecondary => appTheme.onSecondary;
  Color get onBackground => appTheme.onBackground;
  Color get onSurface => appTheme.onSurface;
  Color get onError => appTheme.onError;
  Color get textPrimary => appTheme.textPrimary;
  Color get textSecondary => appTheme.textSecondary;
  Color get textDisabled => appTheme.textDisabled;
  String get headlineFont => appTheme.headlineFont;
  String get bodyFont => appTheme.bodyFont;
  TextStyle get h1 => appTheme.h1;
  TextStyle get h2 => appTheme.h2;
  TextStyle get h3 => appTheme.h3;
  TextStyle get h4 => appTheme.h4;
  TextStyle get h5 => appTheme.h5;
  TextStyle get h6 => appTheme.h6;
  TextStyle get bodyLarge => appTheme.bodyLarge;
  TextStyle get bodyMedium => appTheme.bodyMedium;
  TextStyle get bodySmall => appTheme.bodySmall;
  TextStyle get caption => appTheme.caption;
  TextStyle get overline => appTheme.overline;
  Color get cardBackground => appTheme.cardBackground;
  Color get dividerColor => appTheme.dividerColor;
  Color get shadowColor => appTheme.shadowColor;
  double get borderRadiusSmall => appTheme.borderRadiusSmall;
  double get borderRadiusMedium => appTheme.borderRadiusMedium;
  double get borderRadiusLarge => appTheme.borderRadiusLarge;
  List<BoxShadow> get shadowElevation1 => appTheme.shadowElevation1;
  List<BoxShadow> get shadowElevation2 => appTheme.shadowElevation2;
}

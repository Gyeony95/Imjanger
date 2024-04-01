import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imjanger/resources/colors.dart';

class ImjangCatchTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
  themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
    );
  }

  static ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryBase,
    primaryContainer: AppColors.primaryLight,
    secondary: AppColors.secondaryBase,
    secondaryContainer: AppColors.secondaryLight,
    background: AppColors.primaryBackground,
    surface: AppColors.primaryBackground,
    onBackground: AppColors.black,
    error: AppColors.errorBase,
    onError: AppColors.errorLight,
    onPrimary: _lightFillColor,
    onSecondary: AppColors.secondaryLight,
    onSurface: AppColors.black,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = ColorScheme(
    primary: AppColors.primaryBase,
    primaryContainer: AppColors.primaryDark,
    secondary: AppColors.secondaryBase,
    secondaryContainer: AppColors.secondaryDark,
    background: AppColors.primaryBackground,
    surface: AppColors.primaryBackground,
    onBackground: AppColors.black,
    error: AppColors.errorBase,
    onError: AppColors.errorDark,
    onPrimary: _darkFillColor,
    onSecondary: AppColors.secondaryDark,
    onSurface: AppColors.black,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    bodySmall: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    titleMedium: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    titleSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    titleLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}
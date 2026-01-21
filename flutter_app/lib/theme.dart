import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class GraniteOliveColors {
  static const Color granite = Color(0xFF4D685A); // Granite
  static const Color mutedTeal = Color(0xFFA4C2A8); // Muted Teal
  static const Color coralGlow = Color(0xFFFF784F); // Coral Glow
  static const Color darkCoffee = Color(0xFF352208); // Dark Coffee
  static const Color oliveWood = Color(0xFF7B6B43); // Olive Wood

  // derived / supporting
  static const Color graniteLight = Color(0xFF6F877A);
  static const Color mutedTealLight = Color(0xFFCFE1D5);
  static const Color coralSoft = Color(0xFFFFA88A);
  static const Color background = Color(0xFFF6F7F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF18201A);
  static const Color darkBackground = Color(0xFF0F1410);
  static const Color darkSurface = Color(0xFF121714);
}

class GraniteOliveTheme {
  GraniteOliveTheme._();

  static const String _fontFamily = 'Lora';

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: GraniteOliveColors.granite,
        onPrimary: Colors.white,
        secondary: GraniteOliveColors.coralGlow,
        onSecondary: Colors.white,
        tertiary: GraniteOliveColors.oliveWood,
        onTertiary: Colors.white,
        error: Color(0xFFB00020),
        onError: Colors.white,
        surface: GraniteOliveColors.surface,
        onSurface: GraniteOliveColors.onSurface,
      ),
      fontFamily: _fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamily,
          fontSize: 20,
          color: GraniteOliveColors.darkCoffee,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: GraniteOliveColors.darkCoffee),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: GraniteOliveColors.background,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: GraniteOliveColors.background,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: GraniteOliveColors.surface,
        selectedItemColor: GraniteOliveColors.granite,
        unselectedItemColor: GraniteOliveColors.granite.withValues(alpha: 0.6),
      ),
      cardTheme: CardThemeData(
        color: GraniteOliveColors.surface,
        shadowColor: GraniteOliveColors.mutedTeal.withValues(alpha: 0.18),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: GraniteOliveColors.darkCoffee,
        ),
        displayMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.darkCoffee,
        ),
        displaySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.darkCoffee,
        ),
        headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.granite,
        ),
        headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.granite,
        ),
        headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.granite,
        ),
        titleLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.darkCoffee,
        ),
        titleMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.darkCoffee,
        ),
        titleSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.darkCoffee,
        ),
        bodyLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          color: GraniteOliveColors.darkCoffee,
        ),
        bodyMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          color: GraniteOliveColors.granite.withValues(alpha: 0.9),
        ),
        bodySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          color: GraniteOliveColors.granite.withValues(alpha: 0.75),
        ),
        labelLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.coralGlow,
        ),
        labelMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.granite,
        ),
        labelSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 11,
          color: GraniteOliveColors.granite.withValues(alpha: 0.7),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.mutedTeal),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.mutedTeal),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.coralGlow, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.darkCoffee),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.darkCoffee, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        floatingLabelStyle: const TextStyle(color: GraniteOliveColors.granite),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(GraniteOliveColors.granite),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(GraniteOliveColors.coralGlow),
          textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: GraniteOliveColors.mutedTealLight,
        onPrimary: Colors.black,
        secondary: GraniteOliveColors.coralSoft,
        onSecondary: Colors.black,
        tertiary: GraniteOliveColors.oliveWood,
        onTertiary: Colors.white,
        error: Color(0xFFFF6B6B),
        onError: Colors.black,
        surface: GraniteOliveColors.darkSurface,
        onSurface: GraniteOliveColors.mutedTealLight,
      ),
      fontFamily: _fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamily,
          fontSize: 20,
          color: GraniteOliveColors.mutedTealLight,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: GraniteOliveColors.mutedTealLight),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: GraniteOliveColors.darkBackground,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      scaffoldBackgroundColor: GraniteOliveColors.darkBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: GraniteOliveColors.darkSurface,
        selectedItemColor: GraniteOliveColors.mutedTealLight,
          unselectedItemColor: GraniteOliveColors.mutedTealLight.withValues(alpha: 0.4),
      ),
        cardTheme: CardThemeData(
          color: GraniteOliveColors.darkSurface,
          shadowColor: Colors.black.withValues(alpha: 0.6),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: GraniteOliveColors.mutedTealLight,
        ),
        displayMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.mutedTealLight,
        ),
        displaySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.mutedTealLight,
        ),
        headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.mutedTealLight,
        ),
        headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.mutedTealLight,
        ),
        headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.mutedTealLight,
        ),
        titleLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.mutedTealLight,
        ),
        titleMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.mutedTealLight,
        ),
        titleSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.mutedTealLight,
        ),
        bodyLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          color: GraniteOliveColors.mutedTealLight,
        ),
        bodyMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          color: GraniteOliveColors.mutedTealLight.withValues(alpha: 0.9),
        ),
        bodySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          color: GraniteOliveColors.mutedTealLight.withValues(alpha: 0.75),
        ),
        labelLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: GraniteOliveColors.coralSoft,
        ),
        labelMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: GraniteOliveColors.mutedTealLight,
        ),
        labelSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 11,
            color: GraniteOliveColors.mutedTealLight.withValues(alpha: 0.7),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.mutedTealLight),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.mutedTealLight),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.coralSoft, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.coralGlow),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GraniteOliveColors.coralGlow, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        floatingLabelStyle: const TextStyle(color: GraniteOliveColors.mutedTealLight),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(GraniteOliveColors.mutedTealLight),
          foregroundColor: WidgetStateProperty.all(Colors.black),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(GraniteOliveColors.coralSoft),
          textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

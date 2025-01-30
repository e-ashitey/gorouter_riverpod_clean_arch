import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// SHADCN UI THEME
ShadThemeData get shadLightTheme => ShadThemeData(
      colorScheme: const ShadSlateColorScheme.light(),
      brightness: Brightness.light,
    );
ShadThemeData get shadDarkTheme => ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: const ShadSlateColorScheme.dark(),
    );

// MATERIAL THEME
ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF070707),
        unselectedItemColor: Color(0xFF404040),
        selectedItemColor: Colors.white,
      ),
    );
ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
    );

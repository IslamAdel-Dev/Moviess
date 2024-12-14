import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFB5B4B4);
  static const Color darkGrey = Color(0xFF343534);
  static const Color mediumDarkGrey = Color(0xFF514F4F);
  static const Color gradientYellowStart = Color(0xFFFFBB3B);
  static const Color gradientYellowEnd = Color(0xFFFFA90A);
  static const Color translucentWhite = Color(0xFFFFFFAC);
  static const Color grey = Color(0xFFC6C6C6);
  static const Color semiTranslucentWhite = Color(0xFFFFFFBE);
  static const Color darkBlack = Color(0xFF121312);
  static const Color steelBlue = Color(0xFF3E4A59);
  static const Color grey70 = Color(0xFF707070);
  static const Color goldenYellow = Color(0xFFF7B539);
  static const Color pitchBlack = Color(0xFF1A1A1A);
  static const Color paleGrey = Color(0xFFCBCBCB);
  static const Color brightYellow = Color(0xFFFFBB3B);
  static const Color deepGrey = Color(0xFF282A28);
  static const Color translucentWhiteLight = Color(0xFFFFFFBF);
  static const Color charcoalGrey = Color(0xFF1D1E1D);
  static const Color mintGreen = Color(0xFF48CFAD);
  static const Color amberOrange = Color(0xFFFFB224);

  static ThemeData lightTheme = ThemeData(
    primaryColor: darkBlack,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: darkBlack,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: pitchBlack,
      selectedItemColor: gradientYellowStart,
      unselectedItemColor: lightGrey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      labelMedium: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      titleSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
    ),
  );
}

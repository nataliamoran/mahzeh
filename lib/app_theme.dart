import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData themeData = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.deepPurple,
      titleTextStyle: GoogleFonts.neucha(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.deepOrange,
        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 20, 5),
        textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.comfortaa().fontFamily),
      ),
    ),
    fontFamily: GoogleFonts.comfortaa().fontFamily,
  );
}

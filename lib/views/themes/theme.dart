import 'package:flutter/material.dart';

class AppTheme {
  //App Colors
  static const MaterialColor materialOrange = MaterialColor(
    0xFFF8C471, 
    <int, Color>{
      050: Color.fromRGBO(248, 196, 113, .1),
      100: Color.fromRGBO(248, 196, 113, .2),
      200: Color.fromRGBO(248, 196, 113, .3),
      300: Color.fromRGBO(248, 196, 113, .4),
      400: Color.fromRGBO(248, 196, 113, .5),
      500: Color.fromRGBO(248, 196, 113, .6),
      600: Color.fromRGBO(248, 196, 113, .7),
      700: Color.fromRGBO(248, 196, 113, .8),
      800: Color.fromRGBO(248, 196, 113, .9),
      900: Color.fromRGBO(248, 196, 113, 1),
    },
  );


  static const Color primaryColor = materialOrange; // Color.fromRGBO(255, 96, 78, 1);
  static const Color secondaryColor = Color.fromRGBO(255, 183, 77, 1.0);
  static const Color backgroundColor = Color.fromRGBO(253, 235, 208, 1);
  static const Color thirdColor = Color.fromRGBO(255, 224, 178, 1.0);
  static const Color subTag = Color.fromRGBO(62, 80, 95, 1.0);

  AppTheme._();

  static final theme = ThemeData(
    appBarTheme: const AppBarTheme( backgroundColor: primaryColor),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // Buttons
    buttonTheme: const ButtonThemeData(buttonColor: thirdColor),
    // Sections Divider
    dividerTheme: const DividerThemeData(color: Color(0xFFE7ECEE),thickness: 4),
    // Elevated Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        side: const BorderSide(color: primaryColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
      ),
    ), colorScheme: ColorScheme.fromSwatch(primarySwatch: materialOrange).copyWith(background: backgroundColor),
  );
}

extension ThemeExtras on ThemeData {
  // Color get particlesColor => Colors.white;
  Color get black => Colors.black;

  Color get white => Colors.white;

  Color get whiteLight => Colors.white70;

  Color get gray => const Color(0xFF696969);

  Color get lightGray => const Color(0xFFE7ECEE);

  Color get darkGray => const Color(0xFF222221); //const Color.fromRGBO(52, 63, 78, 1);
}
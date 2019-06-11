import 'package:flutter/material.dart';

abstract class WhmColors {
  static const int _primary = 0xFF333333; // rgb(51,51,51)
  static const int _secondary = 0xFFFFC400; // rgb(255,196,0)

  static final MaterialColor _primaryColor =
      MaterialColor(_primary, getPrimarySwatch());

  static final MaterialColor _secondaryColor =
      MaterialColor(_secondary, getSecondarySwatch());

  static const Color kWhmRed = Colors.red;
  static const Color kWhmErrorRed = Colors.red;

  static const Color kWhmWhite = Colors.white;
  static const Color kWhmBackgroundWhite = Colors.white70;

  static const Color kWhmGray = Colors.grey;
  static final Color kWhmGray50 = Colors.grey.shade50;

  static const Color kWhmPrimary = Color(_primary);
  static final Color kWhmPrimaryDark = _primaryColor.shade700;

  static const Color kWhmSecondary = Color(_secondary);
  static final Color kWhmSecondaryDark = _secondaryColor.shade700;

  static const Color kWhmTextColor = Colors.white;

  static Map<int, Color> getPrimarySwatch() {
    return const <int, Color>{
      50: Color.fromRGBO(51, 51, 51, .1),
      100: Color.fromRGBO(51, 51, 51, .2),
      200: Color.fromRGBO(51, 51, 51, .3),
      300: Color.fromRGBO(51, 51, 51, .4),
      400: Color.fromRGBO(51, 51, 51, .5),
      500: Color.fromRGBO(51, 51, 51, .6),
      600: Color.fromRGBO(51, 51, 51, .7),
      700: Color.fromRGBO(51, 51, 51, .8),
      800: Color.fromRGBO(51, 51, 51, .9),
      900: Color.fromRGBO(51, 51, 51, 1)
    };
  }

  static Map<int, Color> getSecondarySwatch() {
    return const <int, Color>{
      50: Color.fromRGBO(255, 196, 0, .1),
      100: Color.fromRGBO(255, 196, 0, .2),
      200: Color.fromRGBO(255, 196, 0, .3),
      300: Color.fromRGBO(255, 196, 0, .4),
      400: Color.fromRGBO(255, 196, 0, .5),
      500: Color.fromRGBO(255, 196, 0, .6),
      600: Color.fromRGBO(255, 196, 0, .7),
      700: Color.fromRGBO(255, 196, 0, .8),
      800: Color.fromRGBO(255, 196, 0, .9),
      900: Color.fromRGBO(255, 196, 0, 1)
    };
  }

  ThemeData createWhmTheme();
}

class AppTheme extends WhmColors {
  @override
  ThemeData createWhmTheme() {
    final ThemeData base = ThemeData(
        primarySwatch: WhmColors._primaryColor,
        primaryColor: WhmColors.kWhmPrimary,
        primaryColorDark: WhmColors.kWhmPrimaryDark,
        canvasColor: WhmColors.kWhmPrimary,
        accentColor: WhmColors.kWhmSecondary,
        backgroundColor: WhmColors.kWhmPrimaryDark);

    return base.copyWith(
      buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.normal,
      ),
      textTheme: base.textTheme.copyWith(
          body1: base.textTheme.body1.copyWith(color: WhmColors.kWhmTextColor)),
      textSelectionColor: WhmColors.kWhmGray50,
      errorColor: WhmColors.kWhmErrorRed,
    );
  }

//  ThemeData kWhmTheme = _buildWhmTheme();
}

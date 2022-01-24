import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryHomeScreenColor = Color(0xff2a9d8f);
const kPrimaryFavoriteScreenColor = Color(0xffff8f00);

// answer button
const kAnswerButtonColorLight = Colors.white;
const kAnswerButtonColorDark = Color(0xFF1D1D1D);
const kAnswerButtonColorCorrectAns = Colors.green;
const kAnswerButtonColorSelected = Color(0xffffb703);

// icon controller
const kIconBottomControllerColor = Colors.black54;
const kBottomControllerBackgroundColor = Colors.white;

const kHighlightColor = Color(0xff35858B);

// dark theme color
const kBackgroundDarkColor = Color(0xFF121212);
const kSurfaceDarkColor = Color(0xFF1D1D1D);
const kOnSurfaceDarkColorText = Color(0xFFD2D2D2);
const kOnSurfaceDarkColorText2 = Color(0xFF686868);
const kOnBackgroundDarkColorText = Color(0xFF9E9E9E);
const kPrimaryDarkColor = Color(0xFFC38FFF);
const kSecondaryDarkColor = Color(0xFF6CDAC7);
const kOnPrimaryDarkColor = Color(0xFF231A2E);

// light theme color
const kBackgroundPrimaryLightColor = Color(0xFF535353);
const kPrimaryLightColor = Color(0xFFE5E3DD);

// slider
const kSliderActiveColor = Color(0xffff8f00);
const kSliderInactiveColor = Color(0x26ff8f00);

//style
const kTextStyleTestItemH1 = TextStyle(
    color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0);
const kTextStyleTestItemH2 = TextStyle(
    color: Color(0xff457b9d), fontWeight: FontWeight.bold, fontSize: 16.0);
const kTextStyleSettingsH1 = TextStyle(
    color: Color(0xff457b9d), fontWeight: FontWeight.bold, fontSize: 16.0);
const kTextStyleSettingsH2 =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0);

// progress
const kCircularProgressColor = Color(0xff40916c);

// padding
const kPaddingDefault = 8.0;
const kPaddingDefaultDouble = 16.0;
const kPaddingIconButton = 6.0;

// size
const kSpaceBetweenAnsBox = 2.0;
const kBorderSizeAnsBox = 2.5;

//icon
const kIconColor = Colors.blueGrey;

// card
const kCardRadiusDefault = 8.0;
const kCardElevationDefaut = 3.0;

// theme
final kLightThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
      brightness: Brightness.light, backgroundColor: Colors.white),
  backgroundColor: kBackgroundPrimaryLightColor,
);
// theme
final kDarkThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: kSurfaceDarkColor,
    foregroundColor: kOnSurfaceDarkColorText,
  ),
  backgroundColor: Colors.black87,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: kSurfaceDarkColor,
    unselectedItemColor: Colors.white70,
    selectedItemColor: kHighlightColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kPrimaryDarkColor, foregroundColor: kOnPrimaryDarkColor),
  cardTheme: CardTheme(elevation: 3, color: kSurfaceDarkColor),
  scaffoldBackgroundColor: kBackgroundDarkColor,
  textTheme: TextTheme(
    bodyText1: TextStyle(
        color: kOnSurfaceDarkColorText,
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    bodyText2: TextStyle(color: kOnSurfaceDarkColorText2, fontSize: 15.0),
    button: TextStyle(
      color: kOnPrimaryDarkColor,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
        color: kOnSurfaceDarkColorText,
        fontWeight: FontWeight.bold,
        fontSize: 15.0),
    headline4: TextStyle(
        color: kOnSurfaceDarkColorText2,
        fontWeight: FontWeight.bold,
        fontSize: 15.0),
    headline6: TextStyle(
      color: kOnSurfaceDarkColorText,
    ),
  ),
);

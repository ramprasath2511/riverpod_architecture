part of '../features/app/app.dart';

const _backgroundColor = Colors.black;
const _primaryTextColor = Colors.white;
const _hintTextColor = Colors.white70;
final _inputFillColor = Colors.grey[800];

final _theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: _backgroundColor,
    titleTextStyle: TextStyle(color: _primaryTextColor, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _inputFillColor,
    hintStyle: const TextStyle(color: _hintTextColor),
    labelStyle: const TextStyle(color: _primaryTextColor),
    suffixIconColor: _primaryTextColor,
    border: _border,
    focusedBorder: _border,
    enabledBorder: _border,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: _primaryTextColor),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _primaryTextColor,
    ),
  ),
  cardTheme: const CardThemeData(
    color: _backgroundColor,
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: _backgroundColor,
  iconTheme: const IconThemeData(color: Colors.white),
);

final _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide.none,
);

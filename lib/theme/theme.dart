import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
  dividerColor: Colors.white24,
  scaffoldBackgroundColor: const Color.fromARGB(255, 52, 47, 47),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 52, 47, 47),
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
    centerTitle: true,
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  useMaterial3: true,
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
);

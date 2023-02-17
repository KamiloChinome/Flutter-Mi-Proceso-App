import 'package:flutter/material.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  shadowColor: negro,
  colorScheme:const ColorScheme(
    primary: azulDark, 
    onPrimary: marca2, 
    secondary: blanco, 
    onSecondary: negro, 
    surface: negrodark,
    onSurface: blanco, 
    background: azulDark, 
    onBackground: azulDark, 
    onError: azulDark, 
    brightness: Brightness.dark, 
    error: Colors.red, 
  ),
  primaryColorLight: blanco,
  primaryColorDark: negrodark,
  cardColor: negrodark,
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: blanco, fontFamily: poppinsL),
    suffixIconColor: marca2,
    prefixIconColor: marca2,
    hintStyle: TextStyle(fontFamily: poppinsL),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: marca2
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: azul2
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: marca2,
    elevation: 10,
  ),
  dividerColor: azul2,
  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: marca2,
    collapsedIconColor: marca2,
    textColor: azul2
  ),
  iconTheme: const IconThemeData(color: marca2, size: 30,),
  scaffoldBackgroundColor: azulDark,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 19,
      color: blanco,
      fontFamily: poppinsR
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 25,
      color: blanco,
      fontFamily: poppinsR
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: negro,
      fontFamily: poppinsR
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: blanco,
      fontFamily: poppinsL
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: marca2,
      fontFamily: poppinsB
    ),
    bodyMedium: TextStyle(
      fontSize: 17,
      color: blanco,
      fontFamily: poppinsR
    ),
    labelSmall: TextStyle(
      fontSize: 15,
      color: blanco,
      fontFamily: poppinsR
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      color: blanco,
      fontFamily: poppinsR
    ),
  ),
);


ThemeData lightTheme = ThemeData.dark().copyWith(
  
  shadowColor: Colors.black26,
  colorScheme:const ColorScheme(
    primary: blanco, 
    onPrimary: negro, 
    secondary: marca1, 
    onSecondary: negro, 
    surface: blanco,
    onSurface: blanco, 
    background: azulDark, 
    onBackground: azulDark, 
    onError: azulDark, 
    brightness: Brightness.dark, 
    error: Colors.red, 
  ),
  primaryColorLight: blanco,
  primaryColorDark: marca1,
  cardColor: Colors.grey[200],
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black87, fontFamily: poppinsR, fontSize: 17),
    floatingLabelStyle: TextStyle(color: azulrey, fontFamily: poppinsL),
    suffixIconColor: marca1,
    prefixIconColor: marca1,
    hintStyle: TextStyle(fontFamily: poppinsL, color: Colors.black87),
    enabledBorder: UnderlineInputBorder(

      borderSide: BorderSide(
        color: marca1
      ),
    ),
    focusedBorder: UnderlineInputBorder(

      borderSide: BorderSide(

        color: azulrey
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: marca2,
    elevation: 10,
  ),
  dividerColor: marca1,
  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: opcion2,
    collapsedIconColor: opcion2,
    textColor: azul2,

  ),
  iconTheme: const IconThemeData(color: opcion2, size: 30,),
  scaffoldBackgroundColor: blanco,
  appBarTheme: const AppBarTheme(
    backgroundColor: marca1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 19,
      color: blanco,
      fontFamily: poppinsR
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 25,
      color: negro,
      fontFamily: poppinsR
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: negro,
      fontFamily: poppinsR
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: negro,
      fontFamily: poppinsL
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: negro,
      fontFamily: poppinsB
    ),
    bodyMedium: TextStyle(
      fontSize: 17,
      color: negro,
      fontFamily: poppinsR
    ),
    labelSmall: TextStyle(
      fontSize: 15,
      color: negro,
      fontFamily: poppinsR
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      color: blanco,
      fontFamily: poppinsR
    ),
  ),
);


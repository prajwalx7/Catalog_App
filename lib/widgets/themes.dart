import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,//color behind cards
        buttonTheme: ButtonThemeData(buttonColor: darkbluishColor),//add cart button color
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.deepPurple, // Set your primary color here
        ),
      );

  static ThemeData darktheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        cardColor: Color.fromARGB(255, 22, 22, 22),
        canvasColor: darkCreamColor,//color behind cards
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
       
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(
              255, 26, 68, 103), // Set your primary color here
        
        ),
      );

  static Color creamColor = Color.fromARGB(255, 221, 218, 218);
  static Color darkCreamColor = Color.fromARGB(255, 30, 33, 37);
  static Color darkbluishColor = Color(0xff403b58);
  static Color lightbluishColor = Vx.indigo500;
}

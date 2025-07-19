import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appColors {
  static const Color buttoncolor = Color.fromARGB(255, 231, 174, 193);
  static const Color appbarcolor = Color.fromARGB(255, 231, 174, 193);
  static const Color textcolor = Color.fromARGB(255, 58, 59, 59);
}

class appFonts {
  static TextStyle heading = GoogleFonts.rougeScript(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: appColors.textcolor,
  );
}

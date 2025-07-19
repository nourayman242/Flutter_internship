import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantrypal/cubits/theme_cubits/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(lightTheme);

  //static final lighttheme = ThemeData.light();

  static final lightTheme = ThemeState(
    themeData: ThemeData.light(),
    isDarkMode: false,
    primaryColor: Colors.teal,
    cardColor: Colors.white,
    textColor: Colors.black,
    cardBackgroundColor: Colors.white,
  );
  //static final darktheme = ThemeData.dark();
  static final darkTheme = ThemeState(
    themeData: ThemeData.dark(),
    isDarkMode: true,
    primaryColor: Colors.tealAccent,
    cardColor: Colors.grey[900]!,
    textColor: Colors.white,
    cardBackgroundColor: Colors.black,
  );
  // void toggletheme() {
  //   if (state == lightTheme) {
  //     emit(_darkTheme as ThemeData);
  //   } else {
  //     emit(lightTheme as ThemeData);
  //   }
  // }
  void toggleTheme() {
    emit(state.isDarkMode ? lightTheme : darkTheme);
  }
}




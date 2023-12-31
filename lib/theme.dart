import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    if (_themeMode == ThemeMode.light) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xffF1F1F1),
    selectedRowColor: Color(0xfffE1E1E1),
    cardColor: Color(0xfffe9e9e9),
    dividerColor: appStartColor,
    hintColor: Colors.grey,
    secondaryHeaderColor: appStartColor,
    hoverColor: ififColor,

    disabledColor: Color(0xfffFF3D75),
    shadowColor: Color(0xfffF0F0F0),
    backgroundColor: Color(0xfff8d8d8d),
    highlightColor: Color(0xfffD9D9D9),
    splashColor: Colors.white,
    indicatorColor: Color(0xfffF7F7F7),
    dialogBackgroundColor: Colors.black,
    scaffoldBackgroundColor: Color(0xffF1F1F1),
    unselectedWidgetColor: Color(0xfffBBBBBB).withOpacity(1),
    canvasColor: appStartColor,
    bottomAppBarColor: appStartColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    brightness: Brightness.light,
    // Customize light theme properties here
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xff1F1F1F),
    secondaryHeaderColor: appStartColor,
    unselectedWidgetColor: Color(0xfffBBBBBB).withOpacity(0.1),
    dividerColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    hoverColor: ififColor,
    disabledColor: Color(0xfffFF3D75),
    indicatorColor: Color(0xfff2D2D2D),
    shadowColor: Color(0xfff2d2d2d),
    canvasColor: const Color(0xfff2d2d2d),
    bottomAppBarColor: Color(0xfff8d8d8d),
    cardColor: Color(0xfff2d2d2d),
    backgroundColor: Color(0xfff8d8d8d),
    highlightColor: Color(0xfffD9D9D9),
    selectedRowColor: Color(0xfffE1E1E1),

    splashColor: Colors.white,
    hintColor: Colors.grey,
    scaffoldBackgroundColor: Color(0xff1F1F1F),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    brightness: Brightness.dark,
    // Customize dark theme properties here
  );
}

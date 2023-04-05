import 'package:flutter/material.dart';

class THemeProvider extends ChangeNotifier {
  bool isDark = false;

  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

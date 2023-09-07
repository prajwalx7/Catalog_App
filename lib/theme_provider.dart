import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class THemeProvider with ChangeNotifier {
  bool isDark = false;

  ThemeData getTheme(BuildContext context) {
    return isDark ? MyTheme.darktheme(context) : MyTheme.lighttheme(context);
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

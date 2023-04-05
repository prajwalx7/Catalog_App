import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/theme_provider.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeProvider = THemeProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<THemeProvider>(
      create: (_) => themeProvider,
      child: Consumer<THemeProvider>(builder: (context, model, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: model.isDark ? ThemeMode.light : ThemeMode.dark,
          theme: MyTheme.lighttheme(context),
          darkTheme: MyTheme.darktheme(context),
          initialRoute: MyRoutes.homeRoute,
          routes: {
            "/": (context) => LoginPage(),
            MyRoutes.homeRoute: (context) => HomePage(),
            MyRoutes.loginRoute: (context) => LoginPage(),
            MyRoutes.cartpageRoute: (context) => CartPage(),
          },
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/forgotpass.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'pages/forgotpass.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system ,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.darktheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.forgotRoute: (context) => ForgotPass(),
        MyRoutes.cartpageRoute: (context) => CartPage(),
      },
    );
  }
}

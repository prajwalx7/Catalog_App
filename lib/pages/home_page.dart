import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  // final int days = 30;
  // final String name = "codepur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content"),
      ),
      body: Center(
        child: Text("we're working here :)"),
      ),
      drawer: MyDrawer(),
    );
  }
}

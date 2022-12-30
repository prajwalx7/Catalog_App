import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final int days = 30;
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => CatalogModel.items[0]);
    int selectedIndex = 0;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Colors.black,
        selectedIndex: selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: Icon(Icons.home),
          ),
          MoltenTab(
            icon: Icon(Icons.search),
          ),
          MoltenTab(
            icon: Icon(Icons.favorite),
          ),
          MoltenTab(
            icon: Icon(Icons.person),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
              key: Key('k'),
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

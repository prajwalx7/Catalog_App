import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'dart:convert';
import 'package:flutter_catalog/widgets/drawer.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tabs> tabs = [];
  @override
  void initState() {
    super.initState();
    loadData();

    tabs.add(Tabs(
      Icons.home,
      "Home",
      Colors.deepPurple,
      getGradient(Colors.deepPurple),
    ));
    tabs.add(
        Tabs(Icons.search, "Search", Colors.amber, getGradient(Colors.amber)));
    tabs.add(Tabs(
        Icons.favorite, "Wishlist", Colors.pink, getGradient(Colors.pink)));
    tabs.add(
        Tabs(Icons.person, "Account", Colors.teal, getGradient(Colors.teal)));
  }

  List productsData = [];

  loadData() async {
    String itemJson = await rootBundle.loadString("asset/files/items.json");
    final decodedData = jsonDecode(itemJson);
    productsData = decodedData["products"];
    setState(() {});
  }

  getGradient(Color color) {
    return LinearGradient(
        colors: [color.withOpacity(0.5), color.withOpacity(0.1)],
        stops: [0.0, 0.7]);
  }

  int currentPosition = 0;
  var currentTitle = '';
  var currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CubertoBottomBar(
        // barBackgroundColor: Colors.black,
        key: Key("BottomBar"),
        inactiveIconColor: Colors.deepPurple,
        tabStyle: CubertoTabStyle
            .STYLE_FADED_BACKGROUND, // By default its CubertoTabStyle.STYLE_NORMAL
        selectedTab:
            currentPosition, // By default its 0, Current page which is fetched when a tab is clickd, should be set here so as the change the tabs, and the same can be done if willing to programmatically change the tab.
        // drawer: CubertoDrawer
        //     ., // By default its NO_DRAWER (Availble START_DRAWER and END_DRAWER as per where you want to how the drawer icon in Cuberto Bottom bar)
        tabs: tabs
            .map((value) => TabData(
                key: Key(value.title),
                iconData: value.icon,
                title: value.title,
                tabColor: value.color,
                tabGradient: value.gradient))
            .toList(),
        onTabChangedListener: (position, title, color) {
          setState(() {
            currentPosition = position;
            currentTitle = title;
            currentColor = color!;
          });
        },
      ),
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            final Item = productsData[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: GridTile(
                header: Container(
                  // ignore: sort_child_properties_last
                  child: Text(
                    productsData[index]["name"],
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                ),
                footer: Text(
                  productsData[index]["price"].toString(),
                ),
                child: Image.network(productsData[index]['image_url']),
              ),
            );
          },
          itemCount: productsData.length,
        ),
        // child: ListView.builder(
        //   itemCount: productsData.length,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       child: ListTile(
        //         leading: Image.network(productsData[index]['image_url']),
        //         title: Text(productsData[index]["name"]),
        //         subtitle: Text(productsData[index]['desc'] ?? "null"),
        //         trailing: Text(
        //           productsData[index]["price"].toString(),
        //           textScaleFactor: 1.2,
        //           style: TextStyle(
        //             color: Colors.deepPurple,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class Tabs {
  final IconData icon;
  final String title;
  final Color color;
  final Gradient gradient;

  Tabs(this.icon, this.title, this.color, this.gradient);
}

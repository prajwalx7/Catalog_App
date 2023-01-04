import 'dart:convert';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

List productsData = [];

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
      backgroundColor: Colors.amber,
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
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              // if (productsData.isEmpty)
              CatalogList().expand(),
              // else
              //   Center(
              //     child: CircularProgressIndicator(),
              //   )
            ],
          ),
        ),
      ),
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkbluishColor).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productsData.length,
      itemBuilder: (context, index) {
        final catalog = productsData[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
            //     child: Row(
            //   children: [
            //     Image.network(catalog['image_url']),
            //   ],
            // )
            )
        .white
        .square(200)
        .make();
  }
}

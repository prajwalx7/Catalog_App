// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';

// List productsData = [];

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
    tabs.add(Tabs(Icons.search, "Search", Colors.lightBlue,
        getGradient(Colors.lightBlue)));
    tabs.add(Tabs(
        Icons.favorite, "Wishlist", Colors.pink, getGradient(Colors.pink)));
    tabs.add(
        Tabs(Icons.person, "Account", Colors.teal, getGradient(Colors.teal)));
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("asset/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    // print("productData : $productsData");
    CatalogModel.items = List.from(productsData).map<Item>((item) {
      // print("item : $item");
      return Item.fromMap(item);
    }).toList();
    // print("catalog : ${CatalogModel.items}");
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
      backgroundColor: MyTheme.creamColor,
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
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
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
      itemCount: CatalogModel.items?.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkbluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                catalog.price.text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkbluishColor,
                      ),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: "Buy".text.make(),
                )
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 80,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}

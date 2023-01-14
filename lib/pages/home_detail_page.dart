import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl.red800.make(),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    // ignore: deprecated_member_use
                    context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
                child: "Add to cart".text.xl.make(),
              ).wh(120, 40)
            ],
          ).pOnly(right: 8.0).p20(),
        ),
        body: Column(
          children: [
            Hero(
              tag: Key(
                catalog.id.toString(),
              ),
              child: Image.asset(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 25,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.center.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Et kasd stet invidunt invidunt ut et eirmod ipsum labore, rebum sadipscing sit sed kasd lorem voluptua dolore labore voluptua, lorem rebum et ea amet dolore at sed ipsum, lorem at sanctus voluptua nonumy. Lorem dolor ipsum lorem erat clita sed vero clita. Takimata duo amet ipsum ipsum amet invidunt. Et erat diam at rebum lorem et clita magna clita. Erat dolor nonumy erat aliquyam no ipsum kasd takimata invidunt."
                          .text
                          .textStyle(context.captionStyle)
                          .align(TextAlign.center)
                          .make()
                          .p16()
                    ],
                  ).pOnly(top: 50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

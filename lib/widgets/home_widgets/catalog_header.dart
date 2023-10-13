import 'package:flutter/material.dart';
import 'package:flutter_catalog/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatefulWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  State<CatalogHeader> createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {
  bool isDarkMode = false;
  changeTheme() {
    Provider.of<THemeProvider>(context, listen: false).changeTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Catalog App"
                .text
                .xl4
                .bold
                .color(context.theme.colorScheme.secondary)
                .make(),
            IconButton(
              onPressed: () {
                changeTheme();
              },
              icon: Provider.of<THemeProvider>(context).isDark
                  ? Icon(
                      Icons.dark_mode,
                      color: (context.theme.colorScheme.secondary),
                    )
                  : Icon(
                      Icons.light_mode,
                      color: (context.theme.colorScheme.secondary),
                    ),
            )
          ],
        ),
        "Trending Products"
            .text
            .xl
            .color(context.theme.colorScheme.secondary)
            .make(),
      ],
    );
  }
}

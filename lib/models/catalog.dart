class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: "Nike Air Force 1",
      desc: "Men's Shoes",
      price: 4200,
      color: "#33505a",
      image:
          "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/0ba53757-d5d9-4ed2-a20d-b4253633ee21/custom-nike-air-force-1-low-by-you.png",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

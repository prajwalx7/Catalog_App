import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get ycatalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

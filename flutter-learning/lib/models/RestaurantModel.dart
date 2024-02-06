import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/models/food.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantModel {
  // catalog field
  late FoodModel _food;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  FoodModel get food => _food;

  set food(FoodModel newfood) {
    _food = newfood;
  }

  // Get items in the cart
  List<Foods>? get items => _itemIds.map((id) => _food.getById(id)).toList();
}

class AddMutation extends VxMutation<MyStore> {
  final Foods item;

  AddMutation(this.item);
  @override
  perform() {
    store!.restaurant._itemIds.add(item.id - 1);
  }
}

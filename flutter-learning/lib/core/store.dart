import 'package:flutter_application_0/models/CartModel.dart';
import 'package:flutter_application_0/models/food.dart';
import 'package:flutter_application_0/models/restaurantModel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  FoodModel foods = FoodModel();
  CartModel cart = CartModel();
  RestaurantModel restaurant = RestaurantModel();

  MyStore() {
    foods = FoodModel();
    restaurant = RestaurantModel();
    cart = CartModel();
    cart.food = foods;
    restaurant.food = foods;
  }
}

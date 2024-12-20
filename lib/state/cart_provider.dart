import 'package:flutter/material.dart';
import '../models/food_item.dart';

class CartProvider with ChangeNotifier {
  final List<FoodItem> _cartItems = [];

  List<FoodItem> get cartItems => _cartItems;

  void addToCart(FoodItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

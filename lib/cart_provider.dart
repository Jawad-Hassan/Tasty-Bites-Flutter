import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_restaurant/cart_model.dart';

class CartProvider extends ChangeNotifier {

  List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  int get cartCount => _cartItems.length;

  int get itemCount {
    int totalQuantity = 0;
    for (var item in _cartItems) {
      totalQuantity += item.quantity;
    }
    return totalQuantity;
  }


  double get totalPrice {
    return _cartItems.fold(
        0.0, (total, current) => total + (current.price * current.quantity));
  }

  void addToCart(Item newItem) {
    final existingItemIndex =
    _cartItems.indexWhere((item) => item.name == newItem.name);

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity++;
    } else {
      _cartItems.add(Item(
        name: newItem.name,
        price: newItem.price,
        quantity: 1,
        imagePath: newItem.imagePath,
      ));
    }

    notifyListeners();
  }

  void removeFromCart(Item itemToRemove) {
    final existingItemIndex =
    _cartItems.indexWhere((item) => item.name == itemToRemove.name);

    if (existingItemIndex != -1) {
      if (_cartItems[existingItemIndex].quantity > 1) {
        _cartItems[existingItemIndex].quantity--;
      } else {
        _cartItems.removeAt(existingItemIndex);
      }
    }

    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

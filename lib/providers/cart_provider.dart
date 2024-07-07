import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe_model.dart';
import 'package:pair/pair.dart';

class CartProvider extends ChangeNotifier {
  List<ShoeModel> _availableItems = [];
  List<Pair<ShoeModel, int>> _cart = [];

  List<ShoeModel> get availableItems => _availableItems;
  List<Pair<ShoeModel, int>> get cart => _cart;

  CartProvider() {
    _availableItems = getItemsFromDatabase();
  }

  List<ShoeModel> getItemsFromDatabase() {
    // In a real app, this would fetch data from a database
    return [
      const ShoeModel(
        imagePath: 'assets/airmax.png',
        name: 'Air Max',
        description: 'With the latest in Nike Air technology, the Nike Air Max 270 delivers unrivaled comfort and style.',
        price: 169.99,
      ),
      const ShoeModel(
        imagePath: 'assets/airforce1.png',
        name: 'Air Force 1',
        description: 'The Nike Air Force 1 is a classic basketball shoe that has been updated with modern details.',
        price: 189.99,
      ),
      const ShoeModel(
        imagePath: 'assets/airforce1low.png',
        name: 'Air Force 1 Low',
        description: 'The Nike Air Force 1 Low is a classic basketball shoe that has been updated with modern details.',
        price: 199.99,
      ),
      const ShoeModel(
        imagePath: 'assets/force58.png',
        name: 'Force 58',
        description: 'The Nike Force 58 is a classic basketball shoe that has been updated with modern details.',
        price: 129.99,
      ),
      const ShoeModel(
        imagePath: 'assets/revolution7.png',
        name: 'Revolution 7',
        description: 'An affordable running shoe that provides comfort and support for all types of runners.',
        price: 79.99,
      ),
    ];
  }

  void addToCart(ShoeModel shoe) {
    final index = _cart.indexWhere((element) => element.key == shoe);
    if (index != -1) {
      _cart[index] = Pair(_cart[index].key, _cart[index].value + 1);
    } else {
      _cart.add(Pair(shoe, 1));
    }
    notifyListeners();
  }

  void removeFromCart(ShoeModel shoe) {
    final index = _cart.indexWhere((element) => element.key == shoe);
    if (index != -1) {
      _cart.removeAt(index);
    }
    notifyListeners();
  }
}

/*import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> _favouriteProducts = [];

  List<Product> get favouriteProduct => _favouriteProducts;

  void updateFavoriteStatus(Product product) {
    if (_favouriteProducts.contains(product)) {
      _favouriteProducts.remove(product);
    } else {
      _favouriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favouriteProducts.contains(product);
  }
}*/
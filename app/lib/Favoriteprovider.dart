import 'package:app/models/furniture.dart';
import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Furniture> _favoriteItems = [];

  List<Furniture> get favoriteItems => _favoriteItems;

  void addFavorite(Furniture item) {
    if (!_favoriteItems.contains(item)) {
      _favoriteItems.add(item);
      notifyListeners(); // Notify listeners when the list changes
    }
  }

  void removeFavorite(Furniture item) {
    if (_favoriteItems.contains(item)) {
      _favoriteItems.remove(item);
      notifyListeners(); // Notify listeners when the list changes
    }
  }

  bool isFavorite(Furniture item) {
    return _favoriteItems.contains(item);
  }
}

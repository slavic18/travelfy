import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SearchItem {
  final String type;
  final String country;
  SearchItem(this.country, this.type);
}

class SearchModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final DateTime _date = new DateTime.now();

  final List<SearchItem> _items = [];

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(SearchItem item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
  void setDestination(String destination) {
    // _items.add(item);
    print(destination);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
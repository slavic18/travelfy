import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SearchItem {
  String type;
  String country;

  SearchItem(this.country, this.type);
}

class SearchModel extends ChangeNotifier {
  /// Internal, private state of the cart.
   DateTime _date = new DateTime.now();
   DateTime _dateTo = new DateTime.now();

  final List<SearchItem> _items = [];

  List<SearchItem> getItems() {
    return this._items;
  }

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(SearchItem item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  DateTime getDate(type){
    if(type == "from") {
      return this._date;
    }else {
      return this._dateTo;
    }
  }

  void addStop(SearchItem item) {
    int index = _items.length > 1 ? _items.length - 1: 1;
    _items.insert(index, item);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  String getDestination(){
    return _items.last.country;
  }


  String getFrom(){
    return _items[0].country;
  }

  List<String> getStops(){
    List<String> stops = [];

    _items.forEach((element) {

      if(element.type == "stop" || element.type == "transit" ) {
        stops.add(element.country);
      }
    });

    print(stops);


    return stops;
  }



  void setDestination(String destination) {
    // _items.add(item);
    print(destination);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
  void setDate(DateTime dateTime, type) {

    if(type == "from") {
      this._date = dateTime;
    }
    if(type == "to") {
      this._dateTo = dateTime;
    }
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void setCountry(String country, int index) {
    this._items.elementAt(index).country = country;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void deleteItem(int index) {
    this._items.removeAt(index );
    notifyListeners();

  }
  List<String> getErrors(){
    List<String> errors = [];

    for(int i = 0; i < _items.length;i++) {
      if(_items[i].country == "" || _items[i].country == "Select a country") {
        errors.add("Please select countries for all fields");
      }
    }
    if(_date.compareTo(_dateTo) > 0) {
      errors.add("Please select a correct date");
    }
    return errors;

  }
  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

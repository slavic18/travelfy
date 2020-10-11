import 'dart:collection';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:travelfy/models/country.dart';
import 'package:flutter/services.dart' show rootBundle;

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

  DateTime getDate(type) {
    if (type == "from") {
      return this._date;
    } else {
      return this._dateTo;
    }
  }

  void addStop(SearchItem item) {
    int index = _items.length > 1 ? _items.length - 1 : 1;
    _items.insert(index, item);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  String getDestination() {
    return _items.last.country;
  }


  String getFrom() {
    return _items[0].country;
  }

  List<String> getStops() {
    List<String> stops = [];

    _items.forEach((element) {
      if (element.type == "stop" || element.type == "transit") {
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
    if (type == "from") {
      this._date = dateTime;
    }
    if (type == "to") {
      this._dateTo = dateTime;
    }
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void setCountry(String country, int index) {
    this._items
        .elementAt(index)
        .country = country;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void deleteItem(int index) {
    this._items.removeAt(index);
    notifyListeners();
  }

  List<String> getErrors() {
    List<String> errors = [];

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].country == "" || _items[i].country == "Select a country") {
        errors.add("Please select countries for all fields");
      }
    }
    if (_date.compareTo(_dateTo) > 0) {
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

  Future<List<CountryData>> getSearchResult( ) async {


    List<CountryData> countries = [];


    String data = await rootBundle.loadString("data/mock.json");
    Map<String, dynamic> l = json.decode(data)['__collections__']['countries'];

    String from = this.getFrom();
    String destination = this.getDestination();

    List<String> stops = this.getStops();
    if(stops.length > 0) {

      for(int i = 0; i < stops.length; i++) {
        if(l[from] != null && l[from]['__collections__'] != null && l[from]['__collections__']['countries']
            != null &&  l[from]['__collections__']['countries'][destination]  != null ) {
          countries.add(CountryData.fromJson(l[from]['__collections__']['countries'][destination]));
        }
      }
    }
    print("_____1");

    print( l[from]['__collections__']['countries'][destination]);

    print("_____2");
    if(l[from] != null && l[from]['__collections__'] != null && l[from]['__collections__']['countries']
        != null &&  l[from]['__collections__']['countries'][destination]  != null ) {
        countries.add(CountryData.fromJson(l[from]['__collections__']['countries'][destination]));
    }

    print(from+ destination);

    return countries;
  }

}

import 'package:flutter/material.dart';

class FavourtieProvider extends ChangeNotifier {
  List _selectItem = [];

  List get selectItem => _selectItem;

  void addItem(int value) {
    _selectItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectItem.remove(value);
    notifyListeners();
  }
}

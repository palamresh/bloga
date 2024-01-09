import 'package:flutter/material.dart';

class SliderOneProvider extends ChangeNotifier {
  double _value = 1.0;

  double get value => _value;

  void getValue(double Value) {
    _value = Value;
    notifyListeners();
  }
}

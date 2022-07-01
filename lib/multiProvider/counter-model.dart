import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;

  // setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

class CongModel with ChangeNotifier{
  int _so = 0;
  laySo() => _so;
  void tangSo(){
    _so++;
    notifyListeners();
  }
}
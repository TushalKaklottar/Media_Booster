import 'package:flutter/material.dart';

class TabControllerProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setTabIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

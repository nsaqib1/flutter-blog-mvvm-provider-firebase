import 'package:flutter/material.dart';

class EditProfileCotroller extends ChangeNotifier {
  int _tabBarIndex = 0;
  get tabBarIndex => _tabBarIndex;

  onBack(BuildContext context) {
    if (_tabBarIndex == 0) {
      Navigator.of(context).pop();
    } else {
      _tabBarIndex = 0;
      notifyListeners();
    }
  }

  viewChange(int index) {
    _tabBarIndex = index;

    notifyListeners();
  }
}

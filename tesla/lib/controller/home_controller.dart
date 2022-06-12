import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomTab = 0;

  void onNaTindexChange(int index) {
    selectedBottomTab = index;
    notifyListeners();
  }

  bool isRightDoorlocked = true;
  bool isLeftDoorlocked = true;
  bool isTopDoorlocked = true;
  bool isBottomDoorlocked = true;

  void updateRightDoorLocked() {
    isRightDoorlocked = !isRightDoorlocked;
    notifyListeners();
  }

  void updateLeftDoorLocked() {
    isLeftDoorlocked = !isLeftDoorlocked;
    notifyListeners();
  }

  void updateTopDoorLocked() {
    isTopDoorlocked = !isTopDoorlocked;
    notifyListeners();
  }

  void updateBottomDoorLocked() {
    isBottomDoorlocked = !isBottomDoorlocked;
    notifyListeners();
  }
}

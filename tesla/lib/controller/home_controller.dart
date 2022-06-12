import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
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

import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  bool isRightDoorlocked = true;

  void updateRightDoorLocked() {
    isRightDoorlocked = !isRightDoorlocked;
    notifyListeners();
  }
}

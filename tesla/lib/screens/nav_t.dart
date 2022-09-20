import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/constants/constants.dart';

class NavT extends StatelessWidget {
  const NavT({
    Key? key,
    required this.onTap,
    required this.selecteTab,
  }) : super(key: key);

  final int selecteTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: selecteTab,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: List.generate(
          srcIcon.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              srcIcon[index],
              color: index == selecteTab ? primaryColor : Colors.white54,
            ),
            label: " ",
          ),
        ));
  }
}

List<String> srcIcon = [
  "assets/icons/door_lock.svg",
  "assets/icons/Charge.svg",
  "assets/icons/Temp.svg",
  "assets/icons/Tyre.svg"
];

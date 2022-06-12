import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavT extends StatelessWidget {
  const NavT({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/door_lock.svg"),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/Charge.svg"),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/Temp.svg"),
          label: " ",
        ),
      ],
    );
  }
}

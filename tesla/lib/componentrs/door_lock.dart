import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/constants/constants.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.onPress,
    required this.isLocked,
  }) : super(key: key);

  final VoidCallback onPress;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (c, a) => ScaleTransition(
          scale: a,
          child: c,
        ),
        child: isLocked
            ? SvgPicture.asset(
                "assets/icons/door_lock.svg",
                key: const ValueKey("lcok"),
              )
            : SvgPicture.asset(
                "assets/icons/door_unlock.svg",
                key: const ValueKey("unlcok"),
              ),
      ),
    );
  }
}

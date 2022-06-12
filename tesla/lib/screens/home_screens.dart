import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constants/constants.dart';
import 'package:tesla/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      left: constrains.maxWidth * 0.05,
                      child: DoorLock(
                        isLocked: _controller.isLeftDoorlocked,
                        onPress: _controller.updateLeftDoorLocked,
                      ),
                    ),
                    Positioned(
                      right: constrains.maxWidth * 0.05,
                      child: DoorLock(
                        isLocked: _controller.isRightDoorlocked,
                        onPress: _controller.updateRightDoorLocked,
                      ),
                    ),
                    Positioned(
                      top: constrains.maxWidth * 0.05,
                      child: DoorLock(
                        isLocked: _controller.isTopDoorlocked,
                        onPress: _controller.updateTopDoorLocked,
                      ),
                    ),
                    Positioned(
                      bottom: constrains.maxWidth * 0.05,
                      child: DoorLock(
                        isLocked: _controller.isBottomDoorlocked,
                        onPress: _controller.updateBottomDoorLocked,
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }
}

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

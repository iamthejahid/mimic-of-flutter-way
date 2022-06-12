import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constants/constants.dart';
import 'package:tesla/screens/nav_t.dart';
import 'package:tesla/componentrs/door_lock.dart';
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
            bottomNavigationBar: NavT(
              onTap: (int index) {
                _controller.onNaTindexChange(index);
              },
              selecteTab: _controller.selectedBottomTab,
            ),
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
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLocked: _controller.isLeftDoorlocked,
                          onPress: _controller.updateLeftDoorLocked,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLocked: _controller.isRightDoorlocked,
                          onPress: _controller.updateRightDoorLocked,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.25
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLocked: _controller.isTopDoorlocked,
                          onPress: _controller.updateTopDoorLocked,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.35
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLocked: _controller.isBottomDoorlocked,
                          onPress: _controller.updateBottomDoorLocked,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/Battery.svg",
                      width: constrains.maxWidth * 0.4,
                    )
                  ],
                );
              }),
            ),
          );
        });
  }
}

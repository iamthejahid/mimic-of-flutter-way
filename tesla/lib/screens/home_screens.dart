import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tesla/screens/nav_t.dart';
import 'package:tesla/constants/constants.dart';
import 'package:tesla/componentrs/door_lock.dart';
import 'package:tesla/controller/home_controller.dart';
import 'package:tesla/componentrs/battery_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  late AnimationController _tempController;
  late Animation<double> _carShiftAnimation;

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.0, 0.5),
    );
    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.6, 1),
    );
  }

  void setupTempController() {
    _tempController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _carShiftAnimation = CurvedAnimation(
        parent: _tempController, curve: const Interval(0.2, 0.4));
  }

  @override
  void initState() {
    super.initState();

    setupBatteryAnimation();
    setupTempController();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
            [_controller, _batteryAnimationController, _tempController]),
        builder: (context, snapshot) {
          return Scaffold(
            bottomNavigationBar: NavT(
              onTap: (int index) {
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_controller.selectedBottomTab == 1 && index != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }

                if (index == 2) {
                  _tempController.forward();
                } else if (_controller.selectedBottomTab == 2 && index != 2) {
                  _tempController.reverse(from: 0.4);
                }

                _controller.onNaTindexChange(index);
              },
              selecteTab: _controller.selectedBottomTab,
            ),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                    ),
                    Positioned(
                      left: constrains.maxWidth / 2 * _carShiftAnimation.value,
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constrains.maxHeight * 0.1),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
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

// Battery

                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: constrains.maxWidth * 0.4,
                      ),
                    ),
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: const BatteryStatus(),
                      ),
                    ),

                    // Temp

                    TemptBtn(
                      svgSrc: 'assets/icons/coolShape.svg',
                      title: 'Cool'.toUpperCase(),
                      isActive: _controller.isCoolSelected,
                      onPress: _controller.thermUpdate,
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }
}

class TemptBtn extends StatelessWidget {
  const TemptBtn({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.isActive,
    required this.onPress,
  }) : super(key: key);

  final String svgSrc;
  final String title;
  final bool isActive;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? primaryColor : Colors.white38,
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: isActive ? primaryColor : Colors.white38,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

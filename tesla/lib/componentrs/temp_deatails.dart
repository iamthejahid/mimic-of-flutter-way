import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constants/constants.dart';

import '../controller/home_controller.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TemptBtn(
                  svgSrc: 'assets/icons/coolShape.svg',
                  title: 'Cool'.toUpperCase(),
                  isActive: _controller.isCoolSelected,
                  onPress: _controller.updateCooler,
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                TemptBtn(
                  svgSrc: 'assets/icons/heatShape.svg',
                  title: 'Heat'.toUpperCase(),
                  activeColor: redColor,
                  isActive: !_controller.isCoolSelected,
                  onPress: _controller.updateCooler,
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_up,
                    size: 48,
                  )),
              const Text(
                '29' '\u2103',
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 48,
                  )),
            ],
          ),
          Spacer(),
          const Text('CURRENT TEMPERATURE'),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('INSIDE'),
                  Text(
                    '20' '\u2103',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'INSIDE',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    '35' '\u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TemptBtn extends StatelessWidget {
  const TemptBtn(
      {Key? key,
      required this.svgSrc,
      required this.title,
      required this.isActive,
      required this.onPress,
      this.activeColor = primaryColor})
      : super(key: key);

  final String svgSrc;
  final String title;
  final bool isActive;
  final VoidCallback onPress;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      onDoubleTap: onPress,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: isActive ? activeColor : Colors.white38,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

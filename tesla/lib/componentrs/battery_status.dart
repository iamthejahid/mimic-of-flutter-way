import 'package:flutter/material.dart';
import 'package:tesla/constants/constants.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '220 mi',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        const Text(
          '62%',
          style: TextStyle(fontSize: 24),
        ),
        const Spacer(),
        Text(
          'Charging'.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
        const Text(
          "18 min remaining",
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '22 mi/hr',
            ),
            Text('232 v'),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}

import 'package:docs_list/constants.dart';
import 'package:flutter/material.dart';

class TextFieldNamed extends StatelessWidget {
  final String text;
  const TextFieldNamed({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}

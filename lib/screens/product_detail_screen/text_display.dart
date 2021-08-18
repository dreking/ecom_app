import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final String title;
  final String text;
  const TextDisplay({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}

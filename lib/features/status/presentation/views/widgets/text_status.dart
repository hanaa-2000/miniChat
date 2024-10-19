import 'package:flutter/material.dart';

import '../../../../../core/themes/styles.dart';

class TextStatus extends StatelessWidget {
  const TextStatus({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: StylesApp.textStyle16
            .copyWith(color: Colors.black45, fontWeight: FontWeight.bold),
      ),
    );
  }
}

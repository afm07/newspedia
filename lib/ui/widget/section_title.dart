import 'package:flutter/material.dart';

import '../../shared/themes/styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontStyle.copyWith(
            fontSize: 26,
            fontWeight: bold,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          subtitle,
          style: fontStyle.copyWith(fontSize: 16, fontWeight: regular),
        ),
      ],
    );
  }
}

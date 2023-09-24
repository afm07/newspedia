import 'package:flutter/material.dart';
import 'package:news_app/shared/themes/styles.dart';

class AppIcon extends StatelessWidget {
  final String title;

  const AppIcon({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.menu_book_rounded,
          size: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: fontStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          )
        ),
      ],
    );
  }
}
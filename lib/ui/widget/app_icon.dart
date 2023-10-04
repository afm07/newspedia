import 'package:flutter/material.dart';
import 'package:news_app/shared/themes/styles.dart';

class AppIcon extends StatelessWidget {
  final String title;
  final double iconSize;
  final double fontSize;

  const AppIcon(
      {
        Key? key,
        required this.title,
        required this.iconSize,
        required this.fontSize
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.menu_book_rounded,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: fontStyle.copyWith(
            fontSize: fontSize,
            fontWeight: semiBold,
          )
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:news_app/shared/themes/styles.dart';

class NewsTag extends StatelessWidget {
  const NewsTag({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent,
      ),
      child: Text(
        tag,
        style: fontStyle.copyWith(
          fontSize: 14,
          fontWeight: semiBold,
          color: Colors.white,
        ),
      ),
    );
  }
}

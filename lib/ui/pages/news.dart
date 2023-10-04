import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class News extends StatelessWidget {
  final List<NewsModel>? newsModel;
  final dynamic selected;

  const News({
    Key? key,
    this.newsModel,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedNews = newsModel;
    if (selectedNews != null) {
      var newsId = selectedNews[selected];
    }
    return const Center();
  }
}

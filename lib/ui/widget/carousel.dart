import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/shared/themes/styles.dart';
import 'package:news_app/ui/widget/news_tag.dart';

class Carousel extends StatelessWidget {
  final NewsModel? newsModel;
  final int index;

  const Carousel({Key? key, this.newsModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: <Widget>[
              Image.network(
                newsModel!.urlToImage.toString(),
                fit: BoxFit.cover,
                width: 1000.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        NewsTag(tag: newsModel!.category.toString()),
                        Text(
                          newsModel!.title.toString(),
                          style: fontStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: Colors.white),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

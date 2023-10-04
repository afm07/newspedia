import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/ui/pages/news.dart';
import 'package:news_app/ui/widget/carousel.dart';
import 'package:news_app/ui/widget/news_tag.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../provider/theme_provider.dart';
import '../widget/app_header.dart';
import '../widget/section_title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  late List<NewsModel> newsModel;

  int _currentIndex = 0;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    setState(() {
      isLoading = true;
    });

    newsModel = [];

    var jsonText = await rootBundle.loadString('assets/datasource/news.json');
    var res = jsonDecode(jsonText);
    for (var ls in res) {
      newsModel.add(NewsModel.fromJson(ls));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final themeState = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppHeader(themeState: themeState),
            isLoading
                ? buildLoading()
                : Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SectionTitle(
                            title: 'Breaking News 🔥',
                            subtitle:
                                'The latest hot news from around the world.',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildCarousel(),
                          const SizedBox(height: 30),
                          const SectionTitle(
                            title: 'Recommendations',
                            subtitle:
                                'A collection of hot news recommended for you.',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildNewsList(newsModel.toList()),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Row buildLoading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.blue,
            strokeWidth: 2.0,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text('Loading...')),
      ],
    );
  }

  Column buildCarousel() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselSlider(
              items: newsModel
                  .map((item) => Carousel(
                        newsModel: item,
                        index: _currentIndex,
                      ))
                  .toList(),
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  autoPlay: true,
                  height: 200,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 2.15,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: newsModel.length,
          effect: ExpandingDotsEffect(
            dotHeight: 4,
            dotWidth: 4,
            spacing: 8,
            dotColor: Colors.grey.shade200,
            activeDotColor: Colors.blueAccent,
            paintStyle: PaintingStyle.fill,
          ),
        ),
      ],
    );
  }

  Widget buildNewsList(List<NewsModel> newsModel) => ListView.builder(
        shrinkWrap: true,
        itemCount: newsModel.length,
        itemBuilder: (context, index) {
          final news = newsModel[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/news',
                arguments: News(
                  newsModel: newsModel,
                  selected: index,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            news.urlToImage.toString(),
                            fit: BoxFit.cover,
                            height: 120.0,
                            width: 100.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 5,
                                ),
                                child: NewsTag(
                                  tag: news.category.toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 8,
                                ),
                                child: Text(
                                  news.title.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 8,
                                ),
                                child: Text(
                                  news.description.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          );
        },
      );
}

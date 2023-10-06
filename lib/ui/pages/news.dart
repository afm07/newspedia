import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatefulWidget {
  const News({
    Key? key,
  }) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    final routes = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(routes['url']));

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

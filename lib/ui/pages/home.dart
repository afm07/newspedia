import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/themes/styles.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../widget/app_header,dart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  'Breaking News 🔥',
                  style: fontStyle.copyWith(fontSize: 26, fontWeight: bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

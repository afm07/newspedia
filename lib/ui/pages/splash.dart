import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/ui/widget/app_icon.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: const AppIcon(
            title: 'Newspedia',
            iconSize: 36,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

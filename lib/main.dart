import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/home.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/shared/themes/themes.dart';
import 'package:news_app/ui/pages/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();

  void getCurrentTheme() async {
    themeProvider.setDarkTheme =
        await themeProvider.themesPreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        })
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Newspedia',
            theme: Themes.themeData(themeProvider.getDarkTheme, context),
            initialRoute: '/',
            routes:{
              '/' : (context) => const Splash(),
              '/home' : (context) => const MyHomePage(title: 'Newspedia')
            } ,
          );
        },
      ),
    );
  }
}

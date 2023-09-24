import 'package:flutter/material.dart';

import '../../provider/theme_provider.dart';
import 'app_icon.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.themeState,
  });

  final ThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppIcon(title: 'Newspedia'),
          IconButton(
            icon: Icon(
              themeState.getDarkTheme
                  ? Icons.dark_mode
                  : Icons.light_mode_outlined,
              color: themeState.getDarkTheme
                  ? Colors.yellowAccent
                  : Colors.orange[900],
              size: 24,
            ),
            onPressed: () {
              themeState.getDarkTheme
                  ? themeState.setDarkTheme = false
                  : themeState.setDarkTheme = true;
            },
          ),
        ],
      ),
    );
  }
}
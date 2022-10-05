import 'package:flutter/material.dart';
import 'package:nike_shop_flutter/features/theme_provider.dart';
import 'package:nike_shop_flutter/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'features/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) {
          return ThemeManager();
        },
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeManager>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: Mythemes.lightTheme,
            darkTheme: Mythemes.darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'Calculator',
            home: const MyHomePage(),
          );
        },
      );
}

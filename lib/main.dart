import 'package:bloga/provider/count_provider.dart';
import 'package:bloga/provider/favourite_provider.dart';
import 'package:bloga/provider/slider_one_provider.dart';
import 'package:bloga/provider/theme_changer_provider.dart';
import 'package:bloga/screen/confeti_widget.dart';
import 'package:bloga/screen/croper_image_example.dart';
import 'package:bloga/screen/drager_example.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => SliderOneProvider()),
          ChangeNotifierProvider(create: (_) => FavourtieProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final changethemeprovider =
              Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Blog Design',
            debugShowCheckedModeBanner: false,
            themeMode: changethemeprovider.thememode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                iconTheme: IconThemeData(color: Colors.pink)),
            home: ConfetiWidgetExample(),
          );
        }));
  }
}

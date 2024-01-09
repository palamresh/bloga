import 'package:bloga/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChangerExample extends StatefulWidget {
  const ThemeChangerExample({super.key});

  @override
  State<ThemeChangerExample> createState() => _ThemeChangerExampleState();
}

class _ThemeChangerExampleState extends State<ThemeChangerExample> {
  @override
  Widget build(BuildContext context) {
    final themechangerprover = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Theme Changer Mode "),
        ),
        body: Column(
          children: [
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themechangerprover.thememode,
              onChanged: themechangerprover.setTheme,
              title: Text("Light Theme"),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themechangerprover.thememode,
              onChanged: themechangerprover.setTheme,
              title: Text("Dark Theme"),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themechangerprover.thememode,
              onChanged: themechangerprover.setTheme,
              title: Text("System Theme"),
            ),
            Icon(Icons.favorite)
          ],
        ));
  }
}

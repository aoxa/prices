import 'package:flutter/material.dart';
import 'package:prices_app/screens/main_page.dart';
import 'package:prices_app/screens/register_screen.dart';
import 'package:prices_app/themeProvider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prices App',
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const RegisterScreen(),
    );
  }
}

import 'package:authy/presentation/landing/landing.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authy',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.materialBaseline),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.materialBaseline),
      themeMode: ThemeMode.system,
      home: const LandingPage(),
    );
  }
}

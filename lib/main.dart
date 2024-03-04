import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
          .copyWith(background: Colors.white),
    );

    final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
          .copyWith(background: Colors.black),
    );

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? lightTheme : darkTheme,
      home: const CalculatorScreen(),
    );
  }
}

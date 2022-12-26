import 'package:climate_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    const ClimateApp(),
  );
}

class ClimateApp extends StatelessWidget {
  const ClimateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';

void main() {
  runApp(const SunApp());
}

class SunApp extends StatelessWidget {
  const SunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "The Sun's Secret Adventure",
      theme: appTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

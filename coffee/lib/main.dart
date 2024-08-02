import 'package:coffee/core/app_style.dart';
import 'package:coffee/di.dart';
import 'package:coffee/view/navigation/main_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: appColorPrimary)),
      home: const AppMainBottomNavigation(),
    );
  }
}

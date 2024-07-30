import 'package:coffee/di.dart';
import 'package:flutter/material.dart';
import 'package:coffee/core/app_theme.dart';
import 'package:coffee/view/user/screens/user_list_screen.dart';

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
      theme: AppTheme.lightAppTheme,
      home: const UserListScreen(),
    );
  }
}

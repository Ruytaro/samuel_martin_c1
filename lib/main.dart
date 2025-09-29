import 'package:flutter/material.dart';
import 'views/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workbook Flutter 1',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/models/user.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
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
  UserManager userManager = UserManager();
  runApp(const MyApp());
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/view_notifier.dart';
import 'views/login.dart';
import 'views/register.dart';
import 'views/secondary.dart';
import 'views/profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewNotifier(),
      child: MaterialApp(
        title: 'Workbook Flutter 1',
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
        ),
        home: const ViewManager(),
      ),
    );
  }
}

class ViewManager extends StatelessWidget {
  const ViewManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewNotifier>(
      builder: (context, viewNotifier, child) {
        switch (viewNotifier.currentView) {
          case ViewType.login:
            return const LoginScreen();
          case ViewType.register:
            return const Register();
          case ViewType.secondary:
            return const Secondary();
          case ViewType.profile:
            return const Profile();
        }
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}
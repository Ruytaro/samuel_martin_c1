import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';
import 'package:samuel_martin_c1/widgets/drawer.dart';

import '../services/user_manager.dart';
import '../models/user.dart';

class Secondary extends StatefulWidget {
  const Secondary({super.key});

  @override
  State<Secondary> createState() => _SecondaryState();
}

class _SecondaryState extends State<Secondary> {
  late User _user;
  late String _username;
  @override
  void initState() {
    super.initState();
    _user = UserManager().getCurrentUser;
    _username = _user.username!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: const Text('Secondary Screen')),
      body: Center(child: Column(
        children: [
          Text("Welcome back $_username"),
          myElevatedButton(logOut, Text("LogOut"))
        ],
      )),
    );
  }

  void logOut() {
    UserManager().logOut();
    Navigator.pop(context);
  }
}

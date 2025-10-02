import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/views/register.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("data")),
          ListTile(
            title: Text("data"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Register()),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/user_manager.dart';
import '../views/profile.dart';

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
          DrawerHeader(child: Text("Menu")),
          ListTile(
            title: Text("LogOut"),
            onTap: () {
              UserManager().logOut();
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            ),
          ),
          ListTile(
            title: Text("Exit"),
            onTap: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../services/user_manager.dart';
import '../services/view_notifier.dart';

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
              context.read<ViewNotifier>().goToLogin();
            },
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () {
              context.read<ViewNotifier>().goToProfile();
              Navigator.pop(context);
            },
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

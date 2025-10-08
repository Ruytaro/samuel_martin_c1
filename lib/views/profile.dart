import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_manager.dart';
import '../widgets/images.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User _user;
   @override
  void initState() {
    super.initState();
    _user = UserManager().getCurrentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              myImageFile(_user.avatar,250),
              Text(_user.username!),
            ],
          ),
        ),
      ),
    );
  }
}
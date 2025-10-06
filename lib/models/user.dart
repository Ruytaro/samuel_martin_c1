import 'package:flutter/material.dart';

class User {
  String username;
  String password;
  late Image? avatar;
  late int? age;


  User({required this.username, required this.password, this.avatar,  this.age});
  
  set setAvatar(Image avatar) => this.avatar = avatar;
  set setAge(int age) => this.age = age;
  Image? get getAvatar => avatar;
  int? get getAge => age;
}

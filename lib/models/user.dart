import 'package:flutter/material.dart';

class User {
  String username;
  String password;
  late Image avatar;
  late int age;


  User({required this.username, required this.password});
  
  set setAvatar(avatar) => this.avatar = avatar;
  set setAge(age) => this.age = age;
  get getAvatar => avatar;
  get getAge => age;
}

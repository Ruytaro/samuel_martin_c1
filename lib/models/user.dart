import 'package:image_picker/image_picker.dart';

class User {
  String username;
  String password;
  late XFile? avatar;
  late int? age;


  User({required this.username, required this.password, this.avatar,  this.age});
  
  set setAvatar(XFile avatar) => this.avatar = avatar;
  set setAge(int age) => this.age = age;
  XFile? get getAvatar => avatar;
  int? get getAge => age;
}

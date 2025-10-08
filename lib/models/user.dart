class User {
  String? _username;
  String? _password;
  late String avatar;
  late int age;
  late String pronoum;
  late String province;

  User(
    String username,
    String password, {
    this.avatar = "assets/images/avatar.png",
    this.age = 33,
    this.pronoum = "Any",
    this.province = "Huesca",
  }) {
    _username = username;
    _password = password;
  }

  String get getAvatar => avatar;
  int get getAge => age;

  bool checkLogin(String name, String pass) {
    if (_username == name) {
      return _isPasswordRight(pass);
    }
    return false;
  }

  bool _isPasswordRight(String pass) {
    return pass == _password;
  }
}

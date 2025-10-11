class User {
  String? username;
  String? _password;
  String avatar;
  int age;
  String pronoum;
  String province;

  User(
    String this.username,
    String password, {
    this.avatar = "images/avatar.png",
    this.age = 33,
    this.pronoum = "Any",
    this.province = "Huesca",
  }) {
    _password = password;
  }

  bool checkLogin(String name, String pass) {
    if (username == name) {
      return _isPasswordRight(pass);
    }
    return false;
  }

  bool _isPasswordRight(String pass) {
    return pass == _password;
  }
}

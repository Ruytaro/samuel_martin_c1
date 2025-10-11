import 'dart:collection';

import '../models/user.dart';

class UserManager {
  static final UserManager _manager = UserManager._internal();

  final Map<String, User> _users = HashMap();
  User? _currentUser;
  User get getCurrentUser => _currentUser!;

  UserManager._internal();

  factory UserManager() {
    return _manager;
  }

  bool register(User user) {
    final name = user.username!;
    if (_users.containsKey(name)) {
      return false;
    }
    _users[name] = user;
    return true;
  }

  void logOut(){
    _currentUser=null;
  }

  bool authenticate(String username, String password) {
    if (!_users.containsKey(username)) {
      return false;
    }
    User user = _users[username]!;
    if (user.checkLogin(username, password)) {
      _currentUser = user;
      return true;
    }
    return false;
  }
}

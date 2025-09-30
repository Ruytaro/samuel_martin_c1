import '../models/user.dart';

class UserManager {
  static final UserManager _manager = UserManager._internal();

  final List<User> _users = [];
  User? _currentUser;
  User? get currentUser => _currentUser;
  
  UserManager._internal();

  factory UserManager() {
    return _manager;
  }
  
  void register(String username, String password) {
    _users.add(User(username: username, password: password));
  }

  bool authenticate(String username, String password) {
    for (var user in _users) {
      if (user.username == username && user.password == password) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }
}
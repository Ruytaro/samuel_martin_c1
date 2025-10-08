import '../models/user.dart';

class UserManager {
  static final UserManager _manager = UserManager._internal();

  final List<User> _users = [];
  User? _currentUser;
  User get getCurrentUser => _currentUser!;

  UserManager._internal();

  factory UserManager() {
    return _manager;
  }

  void register(User user) {
    _users.add(user);
  }

  bool authenticate(String username, String password) {
    for (var user in _users) {
      if( user.checkLogin(username, password)) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }
}

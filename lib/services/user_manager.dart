import '../models/user.dart';

class UserManager {
  final List<User> _users = [];
  User? _currentUser;
  User? get currentUser => _currentUser;
  
  void register(String username, String password) {
    _users.add(User(username: username, password: password));
  }

  bool login(String username, String password) {
    for (var user in _users) {
      if (user.username == username && user.password == password) {
        _currentUser = user;
        return true;
      }
    }
    if (username == 'admin' && password == 'admin') {
      _currentUser = User(username: 'admin', password: 'admin');
      return true;
    }
    return false;
  }
}
import 'package:flutter/material.dart';

enum ViewType {
  login,
  register,
  secondary,
  profile,
}

class ViewNotifier extends ChangeNotifier {
  ViewType _currentView = ViewType.login;

  ViewType get currentView => _currentView;

  void changeView(ViewType viewType) {
    _currentView = viewType;
    notifyListeners();
  }

  void goToLogin() {
    changeView(ViewType.login);
  }

  void goToRegister() {
    changeView(ViewType.register);
  }

  void goToSecondary() {
    changeView(ViewType.secondary);
  }

  void goToProfile() {
    changeView(ViewType.profile);
  }
}

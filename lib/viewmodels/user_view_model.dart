import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  List<UserModel> _users = [];

  List<UserModel> get users => _users;
  void addUser(UserModel user) {
    _users.add(user);
    notifyListeners();
  }

  void removeuser(UserModel user) {
    _users.remove(user);
    notifyListeners();
  }

  void updateUser(UserModel oldUser, UserModel newUser) {
    final index = _users.indexOf(oldUser);
    _users[index] = newUser;
    notifyListeners();
  }
}

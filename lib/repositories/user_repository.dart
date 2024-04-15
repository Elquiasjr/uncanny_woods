import 'package:flutter/material.dart';
import 'package:uncanny_woods/models/user.dart';

class UserRepository extends ChangeNotifier {
  static final List<User> _users = [];

  static User? loggedUser;

  saveUser(User user) {
    _users.add(user);
    loggedUser = user;
    notifyListeners();
  }

  getLoggedUser() {
    return loggedUser;
  }

  setLoggedUser(User user) {
    loggedUser = user;
    notifyListeners();
  }

  UserRepository() {
    _users.addAll([
      User(
          username: 'Robio',
          email: 'rob@gmail.com',
          dateOfBirth: DateTime(2011, 2, 1),
          senha: 'senha123')
    ]);
    notifyListeners();
  }

  List<User> get users => _users;

  updateUser(User user, String username, String email) {
    final oldUser = _users.firstWhere(
      (u) => u.username == username && u.email == email,
    );
    final userIndex = _users.indexOf(oldUser);
    _users.replaceRange(userIndex, userIndex + 1, [
      User(
        username: user.username,
        email: user.email,
        dateOfBirth: user.dateOfBirth,
        senha: user.senha,
      ),
    ]);
    notifyListeners();
  }
}

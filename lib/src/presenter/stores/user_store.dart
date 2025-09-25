import 'package:flutter/material.dart';
import 'package:rental_app/src/external/datasources/user_datasource.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class UserStore extends ChangeNotifier {
  final userDatasource = UserDatasource();

  var _user = User();
  User get user => _user;

  String errorMessage = "";

  Future<bool> login(String username, String password) async {
    User user = User(username: username, password: password);
    bool success = false;
    try {
      final loggedUser = await userDatasource.login(user);
      _user = loggedUser;
      success = true;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
    return success;
  }

  void logout() {
    _user = User();
  }

  void clearErrorMessage() {
    errorMessage = "";
  }
}

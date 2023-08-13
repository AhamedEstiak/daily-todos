import 'package:flutter/material.dart';

class LoginScreenModel extends ChangeNotifier {
  BuildContext? context;
  // LoginScreenModel logic;

  String currentAnimation = 'move';

  // is first time user landing on the login screen
  bool isFirst = false;

  bool showLoginWidget = true;

  LoginScreenModel({this.isFirst = false});

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
    }
  }

  void refresh() {
    notifyListeners();
  }
}

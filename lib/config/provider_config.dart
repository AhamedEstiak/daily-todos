
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_todos/screens/home/login_screen.dart';
import 'package:daily_todos/model/all_model.dart';
import 'package:daily_todos/screens/main/main_screen.dart';

class ProviderConfig {
  static ProviderConfig? _instance;

  static ProviderConfig getInstance() {
    _instance ??= ProviderConfig._internal();
    return _instance!;
  }

  ProviderConfig._internal();

  ChangeNotifierProvider<GlobalModel> getGLobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }

  ChangeNotifierProvider<MainScreenModel> getMainScreen() {
    return ChangeNotifierProvider<MainScreenModel>(
      create: (context) => MainScreenModel(),
      child: const MainScreen(),
    );
  }

  ChangeNotifierProvider<LoginScreenModel> getLoginScreen(
      {bool isFirst = false}) {
    return ChangeNotifierProvider<LoginScreenModel>(
      create: (context) => LoginScreenModel(),
      builder: (context, _) => Builder(
        builder: (BuildContext context) => Consumer<LoginScreenModel>(
          builder: (_, __, ___) => const LoginScreen(),
        ),
      ),
    );
  }
}

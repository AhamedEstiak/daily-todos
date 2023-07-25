import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_todos/model/all_model.dart';

class ProviderConfig {
  static ProviderConfig? _instance;

  ProviderConfig._internal();

  static getInstance() {
    _instance ??= ProviderConfig._internal();
    return _instance;
  }

  ChangeNotifierProvider<GlobalModel> getGLobalModel(Widget child) {
    return ChangeNotifierProvider(
      create: (context) => GlobalModel(),
      child: child,
    );
  }
}

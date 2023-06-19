import 'package:flutter/material.dart';

import 'package:daily_todos/logic/global_logic.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext? context;
  GlobalLogic? logic;

  // app name
  String appName = 'Daily Todos';

  wGlobalModel() {
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('GlobalModel');
  }

  void refresh() {
    notifyListeners();
  }
}

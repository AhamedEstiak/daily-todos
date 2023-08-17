import 'package:flutter/material.dart';

import 'package:daily_todos/model/global_model.dart';
import 'package:daily_todos/logic/all_logic.dart';

class MainScreenModel extends ChangeNotifier {
  BuildContext? context;
  late MainScreenLogic logic;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentAvatarType = CurrrentAvatarType.defaultAvatar;
  String currentAvatarUrl = 'assets/images/icon.png';
  List tasks = [];

  int currentCardIndex = 0;

  late GlobalModel _globalModel;

  MainScreenModel() {
    logic = MainScreenLogic(this);
  }

  void setContext(BuildContext context, {required GlobalModel globalModel}) {
    if (this.context == null) {
      this.context = context;
      _globalModel = globalModel;
    }
  }

  void refresh() {
    notifyListeners();
  }
}

// enum CurrrentAvatar {
// defaultAvatar,
// }

class CurrrentAvatarType {
  static const int defaultAvatar = 0;
  static const int local = 1;
  static const int net = 2;
}

import 'package:flutter/material.dart';

import 'package:daily_todos/json/theme_bean.dart';
import 'package:daily_todos/utils/theme_util.dart';
import 'package:daily_todos/logic/global_logic.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext? context;
  GlobalLogic? logic;

  // app name
  String appName = 'Daily Todos';

  // bool goToLogin;

  ThemeBean currentThemeBean = ThemeBean(
    themeName: MyTheme.darkTheme,
    colorBean: ColorBean.fromColor(MyThemeColor.darkColor),
    themeType: MyTheme.darkTheme,
  );

  bool enableSplashAnimation = true;


  // wGlobalModel() {
  //   logic = GlobalLogic(this);
  // }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      Future.wait([
        logic
      ]).then((value) {
        refresh();
      });
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

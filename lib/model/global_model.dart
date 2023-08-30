import 'dart:developer';

import 'package:daily_todos/constants/all_types.dart';
import 'package:flutter/material.dart';

import 'package:daily_todos/json/theme_bean.dart';
import 'package:daily_todos/utils/theme_util.dart';
import 'package:daily_todos/logic/global_logic.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext? context;
  GlobalLogic? logic;

  // app name
  String appName = 'Daily Todos';



  ThemeBean currentThemeBean = ThemeBean(
    themeName: MyTheme.darkTheme,
    colorBean: ColorBean.fromColor(MyThemeColor.darkColor),
    themeType: MyTheme.darkTheme,
  );

  bool enableSplashAnimation = true;
  bool isBgGradient = false;
  bool isBgChangeWithCard = false;
  bool isCardChangeWithBg = false;
  bool enableNetPicBgInMainScreen = false;
  String currentMainScreenBgUrl = '';
  bool? goToLogin;
  String currentNavHeader = NavHeaderType.meteorShower;
  String currentNetPicUrl = '';

  wGlobalModel() {
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      wGlobalModel();
      Future.wait([
        logic!.getCurrentTheme(),
        logic!.getAppName(),
        logic!.getEnableSplashAnimation(),
        logic!.getLoginState(),
        logic!.getCurrentNavHeader(),
        logic!.getCurrentNetPicUrl(),
      ]).then((value) {
        inspect(value);
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

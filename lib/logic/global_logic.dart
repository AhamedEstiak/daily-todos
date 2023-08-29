import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:daily_todos/json/theme_bean.dart';
import 'package:daily_todos/model/global_model.dart';
import 'package:daily_todos/utils/shared_util.dart';
import 'package:daily_todos/utils/theme_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalLogic {
  final GlobalModel _model;

  GlobalLogic(this._model);

  Future getAppName() async {
    final appName = await SharedUtil.instance.getString(Keys.appName);
    if (appName == null) return;
    if (appName == _model.appName) return;
    _model.appName = appName;
  }

  Future getCurrentTheme() async {
    final theme = await SharedUtil.instance.getString(Keys.currentThemeBean);
    if (theme == null) return _model.currentThemeBean;
    ThemeBean themeBean = ThemeBean.fromMap(jsonDecode(theme));
    if (themeBean.themeType == _model.currentThemeBean.themeType) {
      return;
    }
    if (themeBean.themeType == MyTheme.random) {
      themeBean.colorBean = ColorBean.fromColor(
          Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }
    _model.currentThemeBean = themeBean;
  }

  Color getBgInWhite() {
    final themeType = _model.currentThemeBean.themeType;
    return themeType == MyTheme.darkTheme ? Colors.grey : Colors.white;
  }

  Color getBgInDark() {
    final themeType = _model.currentThemeBean.themeType;
    return themeType == MyTheme.darkTheme ? Colors.grey[800]! : Colors.white;
  }

  Future getEnableSplashAnimation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString(Keys.account) ?? 'default';
    _model.enableSplashAnimation =
        prefs.getBool(Keys.enableSplashAnimation + account) ?? true;
  }
}

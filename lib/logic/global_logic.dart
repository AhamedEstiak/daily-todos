import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:daily_todos/json/theme_bean.dart';
import 'package:daily_todos/model/global_model.dart';
import 'package:daily_todos/utils/shared_util.dart';
import 'package:daily_todos/utils/theme_util.dart';

class GlobalLogic {
  final GlobalModel _model;

  GlobalLogic(this._model);

  Future getAppName() async {
    final appName = await SharedUtil.instance.getString(Keys.appName);
    if(appName == null) return;
    if(appName == _model.appName) return;
    _model.appName = appName;
  }

  Future getCurrentTheme() async {
    final theme = await SharedUtil.instance.getString(Keys.currentThemeBean);
    if (theme == null) return;
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
}

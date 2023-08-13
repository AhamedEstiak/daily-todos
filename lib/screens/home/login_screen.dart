import 'dart:io';


import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_todos/model/all_model.dart';
import 'package:daily_todos/json/color_bean.dart';
import 'package:daily_todos/utils/theme_util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginScreenModel>(context);
    final globalModel = Provider.of<GlobalModel>(context);
    final bgColor = globalModel.logic!.getBgInDark();

    bool isDarkNow =
        globalModel.currentThemeBean.themeType == MyTheme.darkTheme;
    final iconColor = isDarkNow
        ? ColorBean.fromBean(globalModel.currentThemeBean.colorBean)
        : Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'login',
          style: TextStyle(color: bgColor),
        ),
        elevation: 0,
        leading: model.isFirst ? const SizedBox() : IconButton(
          onPressed: () {},
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: iconColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlareActor(
            'flrs/login_bg.flr',
            animation: model.currentAnimation,
            fit: BoxFit.cover,
            callback: (animationName) {
              if(animationName == 'move') {
                model.currentAnimation = 'rotate';
                model.refresh();
              } else if(animationName == 'move_out') {
                Navigator.of(context).pop();
              }
            },
          ),
          model.showLoginWidget ? Text('login') :
          const SizedBox(),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:daily_todos/json/color_bean.dart';
import 'package:daily_todos/utils/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:daily_todos/model/global_model.dart';
import 'package:daily_todos/model/main_screen_model.dart';

class MainScreenLogic {
  final MainScreenModel _model;

  MainScreenLogic(this._model);

  Decoration getBackground(GlobalModel globalModel) {
    bool isBgGradient = globalModel.isBgGradient;
    bool isBgChangeWithCard = globalModel.isBgChangeWithCard;
    bool enableBg = globalModel.enableNetPicBgInMainScreen;
    final bgUrl = globalModel.currentMainScreenBgUrl;

    return enableBg
        ? BoxDecoration(
            image: DecorationImage(
              image: bgUrl.startsWith('http')
                  ? CachedNetworkImageProvider(bgUrl) as ImageProvider
                  : FileImage(File(bgUrl)),
              fit: BoxFit.cover,
            ),
          )
        : BoxDecoration(
            gradient: isBgGradient
                ? LinearGradient(
                    colors: _getGradientColors(isBgChangeWithCard),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
            color: _getBgColor(isBgGradient, isBgChangeWithCard),
          );
  }

  List<Color> _getGradientColors(bool isBgChangeWithCard) {
    final context = _model.context;
    if (!isBgChangeWithCard) {
      return [
        Theme.of(context!).primaryColorLight,
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColorDark,
      ];
    } else {
      return [
        ThemeUtil.getInstance().getLightColor(getCurrentCardColor()),
        getCurrentCardColor(),
        ThemeUtil.getInstance().getDarkColor(getCurrentCardColor()),
      ];
    }
  }

  Color? _getBgColor(bool isBgGradient, bool isBgChangeWithCard) {
    if (isBgGradient) {
      return null;
    }
    final context = _model.context;
    final primaryColor = Theme.of(context!).primaryColor;

    return isBgChangeWithCard ? getCurrentCardColor() : primaryColor;
  }

  Color getCurrentCardColor() {
    final context = _model.context;
    final primaryColor = Theme.of(context!).primaryColor;
    int index = _model.currentCardIndex;
    int taskLength = _model.tasks.length;
    if (taskLength == 0) return primaryColor;
    if (index > taskLength - 1) return primaryColor;
    return ColorBean.fromBean(_model.tasks[index].tasksIconBean.colorBean);
  }

  Widget getAvatarWidget() {
    switch (_model.currentAvatarType) {
      case CurrrentAvatarType.defaultAvatar:
        return Image.asset(
          'assets/images/icon.png',
          fit: BoxFit.cover,
        );

      case CurrrentAvatarType.local:
        File file = File(_model.currentAvatarUrl);
        return Image.file(
          file,
          fit: BoxFit.fill,
        );
      case CurrrentAvatarType.net:
        return SizedBox(
          height: 60,
          width: 60,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Theme.of(_model.context!).primaryColorLight,
            ),
          ),
        );
    }
    return Image.asset(
      'assets/images/icon.png',
      fit: BoxFit.cover,
    );
  }

  void onBackgroundTap(GlobalModel globalModel) {

  }
}

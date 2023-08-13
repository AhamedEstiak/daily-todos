import 'dart:io';

import 'package:flutter/material.dart';

import 'package:daily_todos/model/main_screen_model.dart';

class MainScreenLogic {
  final MainScreenModel _model;

  MainScreenLogic(this._model);

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
}

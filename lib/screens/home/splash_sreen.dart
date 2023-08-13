import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:daily_todos/model/all_model.dart';
import 'package:daily_todos/config/provider_config.dart';

class SplashSreen extends StatelessWidget {
  const SplashSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context);

    return Scaffold(
        body: SizedBox(
      child: FlareActor(
        'assets/flrs/todo_splash.flr',
        animation: 'run',
        fit: BoxFit.cover,
        callback: (animation) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) {
                return getHomeScreen();
              },
            ),
            (Route<dynamic> route) => false,
          );
        },
      ),
    ),);
  }

  Widget getHomeScreen() {
    return ProviderConfig.getInstance().getMainScreen();
  }
}

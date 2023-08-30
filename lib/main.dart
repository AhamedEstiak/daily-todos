import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:daily_todos/utils/theme_util.dart';
import 'package:daily_todos/config/provider_config.dart';
import 'package:daily_todos/model/all_model.dart';
import 'package:daily_todos/screens/home/splash_sreen.dart';
// import 'i10n/localization_intl.dart';

void main() {
  runApp(
    ProviderConfig.getInstance().getGLobal(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<GlobalModel>(context);
    // model.setContext(context);  => is equivalent this

    final model = Provider.of<GlobalModel>(context)..setContext(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: model.appName,
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // DemoLocalizationsDelegate(),
      ],
      supportedLocales: const <Locale>[
         Locale('bn', 'BN'),
         Locale('en', 'US'),
      ],
      theme: ThemeUtil.getInstance().getTheme(model.currentThemeBean),
      home: getHomeScreen(model.goToLogin, model.enableSplashAnimation),
    );
  }

  Widget getHomeScreen(bool? goToLogin, bool enableSplashAnimation) {
    // if(goToLogin == null) return  Container(color: Colors.amberAccent,);
    if(enableSplashAnimation) return const SplashSreen();
    return goToLogin! ? ProviderConfig.getInstance().getLoginScreen(isFirst: true) :
      ProviderConfig.getInstance().getMainScreen();

  }
}
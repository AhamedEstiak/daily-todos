import 'package:daily_todos/json/color_bean.dart';
export 'package:daily_todos/json/color_bean.dart';

class ThemeBean {
  String? themeName;
  ColorBean? colorBean;
  String? themeType;

  ThemeBean({this.themeName, this.colorBean, this.themeType,});

  static ThemeBean fromMap(Map<String, dynamic> map) {
    ThemeBean bean = ThemeBean();
    bean.themeName = map['themeName'];
    bean.colorBean = ColorBean.fromMap(map['colorBean']);
    bean.themeType = map['themeType'];
    return bean;
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'themeName': themeName,
      'colorBean': colorBean!.toMap(),
      'themeType': themeType,
    };
  }



}
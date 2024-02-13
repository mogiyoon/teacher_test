import 'package:flutter/material.dart';
import 'package:teacher_test/main.dart';
import 'package:teacher_test/setting/setting_screen.dart';
import 'package:teacher_test/test/education_introduction/test_introduction_screen.dart';
import 'package:teacher_test/test/test_screen.dart';

class ScreenRouter {
  Map<String, WidgetBuilder> routeIndex() {
    Map<String, WidgetBuilder> routeMap = {
      '/Main': (context) => MyHomePage(),
      '/TestScreen': (context) => TestScreen(),
      '/SettingScreen': (context) => SettingScreen(),
      '/EducationIntroductionScreen': (context) =>
          EducationIntroductionScreen(),
    };
    return routeMap;
  }
}

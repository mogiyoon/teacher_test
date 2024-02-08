import 'package:flutter/material.dart';

class WidgetSetting with ChangeNotifier {
  BuildContext context;
  WidgetSetting(this.context);

  late var widgetFontSize = WidgetFontSize(context);
  var theController = ScrollControllerWidget().theController;
}

class WidgetFontSize {
  BuildContext context;
  WidgetFontSize(this.context);

  double adjustSize = 1;
  late final double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
  late double bigFontSize = 2.6 * unitHeightValue * adjustSize;
  late double mediumFontSize = 2.2 * unitHeightValue * adjustSize;
  late double smallFontSize = 1.9 * unitHeightValue * adjustSize;
}

class ScrollControllerWidget {
  ScrollController theController = ScrollController();
}
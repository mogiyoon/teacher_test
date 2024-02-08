import 'package:flutter/material.dart';

class WidgetControl with ChangeNotifier {
  BuildContext context;
  WidgetControl(this.context);

  late var widgetFontSize = WidgetFontSize(context);
  late var clipBoard = ClipBoard();
}

class WidgetFontSize {
  BuildContext context;
  WidgetFontSize(this.context);

  double adjustSize = 1;

  double unitHeightValue = 1;
  double bigFontSize = 3;
  double mediumFontSize = 2;
  double smallFontSize = 1;

  void returnFontSize(double inputUnitHeightValue) {
    unitHeightValue = inputUnitHeightValue;
    bigFontSize = 2.6 * unitHeightValue * adjustSize;
    mediumFontSize = 2.2 * unitHeightValue * adjustSize;
    smallFontSize = 1.9 * unitHeightValue * adjustSize;
  }
}

class ClipBoard {
  String _copyString = '';

  String get copyString => _copyString;

  set copyString(value) {
    _copyString = value;
  }
}
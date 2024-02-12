import 'package:flutter/material.dart';
import 'package:teacher_test/db/setting_db.dart';

class WidgetControl with ChangeNotifier {
  late var widgetFontSize = WidgetFontSize();
  late var clipBoard = ClipBoard();
  late var spaceSwitch = SpaceSwitch();

  void widgetChanged() {
    notifyListeners();
  }

  void widgetSave() {
    late double adjustSize = widgetFontSize.adjustSize;
    late bool isIncludeSpace = spaceSwitch.isIncludeSpace;

    late var saveSetting = SaveSetting(id: 0, adjustSize: adjustSize, isIncludeSpace: isIncludeSpace);
    SettingDB.deleteSaveSetting(0);
    SettingDB.insertSaveSetting(saveSetting);
  }
}

class WidgetFontSize {
  double adjustSize = 1;

  double unitHeightValue = 1;
  double bigFontSize = 3;
  double mediumFontSize = 2;
  double smallFontSize = 1;

  void returnFontSize(double inputUnitHeightValue) {
    unitHeightValue = inputUnitHeightValue;
    bigFontSize = 2.7 * unitHeightValue * adjustSize;
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

class SpaceSwitch {
  bool isIncludeSpace = false;
}

class SavePrimaryInformation {}

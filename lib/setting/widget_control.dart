import 'package:flutter/material.dart';
import 'package:teacher_test/db/setting_db.dart';
import 'package:teacher_test/function/router.dart';

class WidgetControlProvider with ChangeNotifier {
  var widgetFontSize = WidgetSize();
  var clipBoard = ClipBoard();
  var spaceSwitch = SpaceSwitch();

  void widgetChanged() {
    notifyListeners();
  }

  void widgetSave() {
    late double adjustSize = widgetFontSize.adjustSize;
    late bool isIncludeSpace = spaceSwitch.isIncludeSpace;

    late var saveSetting = SaveSetting(
        id: 0, adjustSize: adjustSize, isIncludeSpace: isIncludeSpace);
    SettingDB.deleteSaveSetting(0);
    SettingDB.insertSaveSetting(saveSetting);
  }


  var textEditRouter = TextEditRouter();
  var testChoiceRouter = TestChoiceRouter();
  late String routeName = '/Main';
}



class WidgetSize {
  double adjustSize = 1;

  double unitHeightValue = 1;
  double bigFontSize = 3;
  double mediumFontSize = 2;
  double smallFontSize = 1;
  double containerSize = 1;

  void returnFontSize(double inputUnitHeightValue) {
    unitHeightValue = inputUnitHeightValue;
    bigFontSize = 2.7 * unitHeightValue * adjustSize;
    mediumFontSize = 2.2 * unitHeightValue * adjustSize;
    smallFontSize = 1.9 * unitHeightValue * adjustSize;
  }
}

class ClipBoard {
  String _copyStringFirst = '';

  String get copyStringFirst => _copyStringFirst;

  set copyStringFirst(value) {
    _copyStringFirst = value;
  }

  String _copyStringSecond = '';

  String get copyStringSecond => _copyStringSecond;

  set copyStringSecond(String value) {
    _copyStringSecond = value;
  }
}

class SpaceSwitch {
  bool isIncludeSpace = false;
}

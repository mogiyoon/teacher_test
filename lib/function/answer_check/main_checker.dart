import 'package:teacher_test/function/answer_check/answer_checker.dart';
import 'package:teacher_test/setting/widget_control.dart';

class MainAnswerChecker {
  List<bool> resultList = [];
  int minLength = 0;
  int maxLength = 0;
  String modifiedString = '';

  List<bool> returnCompareResult(ClipBoard clipBoard, bool isIncludeSpace) {
    String copyStringFirst =
    Remove(isIncludeSpace).space(clipBoard.copyStringFirst);
    String copyStringSecond =
    Remove(isIncludeSpace).space(clipBoard.copyStringSecond);

    if (copyStringFirst.length < copyStringSecond.length) {
      minLength = copyStringFirst.length;
      maxLength = copyStringSecond.length;
    } else {
      minLength = copyStringSecond.length;
      maxLength = copyStringFirst.length;
    }

    for (int i = 0; i < minLength; i++) {
      if (copyStringFirst[i] == copyStringSecond[i]) {
        resultList.add(true);
      } else {
        resultList.add(false);
      }
    }
    if (minLength != maxLength) {
      for (int i = 0; i < maxLength - minLength; i++) {
        resultList.add(false);
      }
    }
    return resultList;
  }

  String returnModifiedString(ClipBoard clipBoard, bool isIncludeSpace) {
    modifiedString = Remove(isIncludeSpace).space(clipBoard.copyStringSecond);
    return modifiedString;
  }
}

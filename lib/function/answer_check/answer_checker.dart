
import 'package:teacher_test/function/answer_check/achieve_checker.dart';
import 'package:teacher_test/function/answer_check/education_introduction_checker.dart';
import 'package:teacher_test/function/answer_check/table_checker.dart';
import 'package:teacher_test/setting/widget_control.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/education_introduction/introduction_builder.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/test_screen.dart';

class CheckAnswer {
  RouteContents? routeContents;
  AchieveTextEditing? newAchieveTextEditor;
  TableTextEditing? newTableTextEditor;
  EducationIntroductionTextEditing? newEducationIntroductionTextEditor;
  WidgetControlProvider widgetControl;

  CheckAnswer(
      {this.routeContents,
      this.newTableTextEditor,
      this.newAchieveTextEditor,
      this.newEducationIntroductionTextEditor,
      required this.widgetControl});

  late int subjectNum = routeContents?.subjectNum ?? 0;
  late bool isTableTest = routeContents?.isTableTest ?? false;
  late bool isAchieveTest = routeContents?.isAchieveTest ?? false;

  late bool isIncludeSpace = widgetControl.spaceSwitch.isIncludeSpace;

  late var textEditRouter = widgetControl.textEditRouter;

  void checkAnswer() {
    if (isTableTest) {
      textEditRouter.writeTableTextEditing(subjectNum, newTableTextEditor!);
      TableCheckAnswer(subjectNum, newTableTextEditor!, isIncludeSpace)
          .tableCheckAnswer();
      newTableTextEditor!.notifyListeners();
    } else if (isAchieveTest) {
      textEditRouter.writeAchieveTextEditing(subjectNum, newAchieveTextEditor!);
      AchieveCheckAnswer(subjectNum, newAchieveTextEditor!, isIncludeSpace)
          .achieveCheckAnswer();
      newAchieveTextEditor!.notifyListeners();
    } else {
      textEditRouter.writeEducationIntroductionTextEditing(
          newEducationIntroductionTextEditor!);
      EducationIntroductionCheckAnswer(
              newEducationIntroductionTextEditor!, isIncludeSpace)
          .educationIntroductionCheckAnswer();
      newEducationIntroductionTextEditor!.notifyListeners();
    }
  }
}

class DeleteAnswer {
  RouteContents? routeContents;
  AchieveTextEditing? newAchieveTextEditor;
  TableTextEditing? newTableTextEditor;
  EducationIntroductionTextEditing? newEducationIntroductionTextEditor;
  WidgetControlProvider widgetControl;

  DeleteAnswer(
      {this.routeContents,
      this.newTableTextEditor,
      this.newAchieveTextEditor,
      this.newEducationIntroductionTextEditor,
      required this.widgetControl});

  late int subjectNum = routeContents?.subjectNum ?? 0;
  late bool isTableTest = routeContents?.isTableTest ?? false;
  late bool isAchieveTest = routeContents?.isAchieveTest ?? false;

  void deleteAnswer() {
    if (isTableTest) {
      TableDeleteAnswer(subjectNum, newTableTextEditor!).tableDeleteAnswer();
    } else if (isAchieveTest) {
      AchieveDeleteAnswer(subjectNum, newAchieveTextEditor!)
          .achieveDeleteAnswer();
    } else {
      EducationIntroductionDeleteAnswer(newEducationIntroductionTextEditor!)
          .educationIntroductionDeleteAnswer();
    }
  }
}

class Remove {
  bool isIncludeSpace;

  Remove(this.isIncludeSpace);

  String otherString = '';
  List<String> otherListString = [''];

  List<String> spaceList(List<String> listString) {
    otherListString = List.from(listString);
    if (isIncludeSpace) {
    } else {
      for (int i = 0; i < otherListString.length; i++) {
        otherListString[i] = otherListString[i].replaceAll(' ', '');
      }
    }
    return otherListString;
  }

  String space(String inputString) {
    otherString = inputString;
    if (isIncludeSpace) {
    } else {
      otherString = otherString.replaceAll(' ', '');
    }
    return otherString;
  }
}


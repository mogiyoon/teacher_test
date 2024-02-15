import 'package:teacher_test/db/wrong_answer_list_db.dart';
import 'package:teacher_test/function/answer_check/achieve_checker.dart';
import 'package:teacher_test/function/answer_check/education_introduction_checker.dart';
import 'package:teacher_test/function/answer_check/table_checker.dart';
import 'package:teacher_test/function/text-sorted_combined.dart';
import 'package:teacher_test/function/widget/screen_widget.dart';
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

  List<String> spaceList(List<String> listString) {
    List<String> otherListString = listString;
    if (isIncludeSpace) {
      return otherListString;
    } else {
      for (int i = 0; i < listString.length; i++) {
        otherListString[i].replaceAll(' ', '');
      }
      return otherListString;
    }
  }

  String space(String inputString) {
    String otherString = inputString;
    if (isIncludeSpace) {
      return otherString;
    } else {
      otherString.replaceAll(' ', '');
      return otherString;
    }
  }
}

class toDB {
  void wrongWriter(String area, String contents) {
    String jsonWrongAnswer =
    WrongAnswerMap().encodeWrongAnswerToJson(area, contents);
    Map<String, dynamic> wrongAnswerUnsortedMap =
    WrongAnswerMap().toWrongAnswerMap(jsonWrongAnswer);
    WrongAnswerBox().writeWrongAnswerMap(wrongAnswerUnsortedMap);
  }
}

class AchieveWrongAnswerToDB {
  List<String> subject = TestSetting().subject;

  //TODO Table, Education 추가
  void achieveWrongWriter(int subjectNum, int grade, String contents) {
    String gradeName = TextSorter().sortingName(subjectNum, grade);
    String area = '성취기준-${subject[subjectNum - 1]}-$gradeName';
    toDB().wrongWriter(area, contents);
  }
}

class TableWrongAnswerToDB {
  List<String> subject = TestSetting().subject;

  void tableTitleWrongWrite(int subjectNum, String contents) {
    String area = '내용체계표-${subject[subjectNum - 1]}-영역';
    toDB().wrongWriter(area, contents);
  }

  void tableLowerCategoryWrongWrite() {

  }
}

class EducationIntroductionWrongAnswerToDB {
  List<String> subject = TestSetting().subject;

  void educationIntroductionWrongWriter(String contents) {
    String area = '총론';
    toDB().wrongWriter(area, contents);
  }
}
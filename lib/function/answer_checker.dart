import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/contents/introduction_contents.dart';
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
  WidgetControl widgetControl;

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

  void checkAnswer() {
    if (isTableTest) {
      TableCheckAnswer(subjectNum, newTableTextEditor!, isIncludeSpace)
          .tableCheckAnswer();
      newTableTextEditor!.notifyListeners();
    } else if (isAchieveTest) {
      AchieveCheckAnswer(subjectNum, newAchieveTextEditor!, isIncludeSpace)
          .achieveCheckAnswer();
      newAchieveTextEditor!.notifyListeners();
    } else {
      EducationIntroductionCheckAnswer(
              newEducationIntroductionTextEditor!, isIncludeSpace)
          .educationIntroductionCheckAnswer();
      newEducationIntroductionTextEditor!.notifyListeners();
    }
  }
}

class AchieveCheckAnswer {
  int subjectNum;
  AchieveTextEditing newTextEditor;
  bool isIncludeSpace;

  AchieveCheckAnswer(this.subjectNum, this.newTextEditor, this.isIncludeSpace);

  var achieve22 = Achieve22();
  late List<String> achieveOneTwo = Remove(isIncludeSpace)
      .spaceList((achieve22.contentsAchieve22Index[subjectNum - 1])[0]);
  late List<String> achieveThreeFour = Remove(isIncludeSpace)
      .spaceList((achieve22.contentsAchieve22Index[subjectNum - 1])[1]);
  late List<String> achieveFiveSix = Remove(isIncludeSpace)
      .spaceList((achieve22.contentsAchieve22Index[subjectNum - 1])[2]);

  late List<List<String>> achieveIndex = [
    achieveOneTwo,
    achieveThreeFour,
    achieveFiveSix
  ];

  late List<int> achieveLengthIndex = [
    0,
    achieveOneTwo.length,
    (achieveOneTwo.length + achieveThreeFour.length),
    (achieveOneTwo.length + achieveThreeFour.length + achieveFiveSix.length),
  ];

  void achieveCheckAnswer() {
    for (int j = 0; j < 3; j++) {
      for (int i = achieveLengthIndex[j]; i < achieveLengthIndex[j + 1]; i++) {
        achieveCheckShowCorrect(i, j);
      }
    }
  }

  void achieveCheckShowCorrect(int i, int j) {
    String removeSpaceText = Remove(isIncludeSpace)
        .space(newTextEditor.achieveControllerList[i].text);
    // j=0 : 1~2, j=1 : 3~4, j=2 : 5~6
    if ((achieveIndex[j]).contains(removeSpaceText)) {
      newTextEditor.achieveControllerAnswerCheckList[i] = 1;
    } else if (newTextEditor.achieveControllerList[i].text == '') {
      newTextEditor.achieveControllerAnswerCheckList[i] = 0;
    } else {
      newTextEditor.achieveControllerAnswerCheckList[i] = 2;
    }
  }
}

class TableCheckAnswer {
  int subjectNum;
  TableTextEditing newTextEditor;
  bool isIncludeSpace;

  TableCheckAnswer(this.subjectNum, this.newTextEditor, this.isIncludeSpace);

  var table22 = Table22();
  late var table22Area = table22.contentsTable22Area;
  late var contentsTable22AreaIndex = table22.contentsTable22AreaIndex;
  late var contentsTable22ValueIndex = table22.contentsTable22ValueIndex;

  // newTextEditor.tableTestTitleEditing;
  // newTextEditor.tableTestCIEditing;
  // newTextEditor.tableTestLowerCategoryEditing;
  // newTextEditor.tableTestValueEditing;

  // Check Text
  // List<TextEditingController> table22AreaIndex[subjectNum - 1] -- tableTitleControllerList
  // List<List<TextEditingController>> table22CIIndex[subjectNum - 1][areaNum] -- tableCIControllerListArea
  // List<List<List<TextEditingController>>> contentsTable22AreaIndex[subjectNum - 1][areaNum][categoryNum] -- tableLowerCategoryControllerListArea
  // List<List<List<List<TextEditingController>>>> contentsTable22ValueIndex[subjectNum - 1][gradeNum][areaNum][categoryItemNum] -- tableValueControllerListArea

  void tableCheckAnswer() {
    tableCheckTitleAnswer();
    tableCheckCIAnswer();
    tableCheckLowerCategoryAnswer();
    tableCheckValueAnswer();
  }

  void tableCheckTitleAnswer() {
    var inputString =
        newTextEditor.tableTestTitleEditing.tableTitleControllerList;

    for (int i = 0; i < inputString.length; i++) {
      if (Remove(isIncludeSpace).space(inputString[i].text) ==
          Remove(isIncludeSpace).space(table22Area[subjectNum - 1][i])) {
        newTextEditor
            .tableTestTitleEditing.tableTitleControllerAnswerCheckList[i] = 1;
      } else if (newTextEditor
              .tableTestTitleEditing.tableTitleControllerList[i].text ==
          '') {
        newTextEditor
            .tableTestTitleEditing.tableTitleControllerAnswerCheckList[i] = 0;
      } else {
        newTextEditor
            .tableTestTitleEditing.tableTitleControllerAnswerCheckList[i] = 2;
      }
    }
  }

  void tableCheckCIAnswer() {
    var inputString =
        newTextEditor.tableTestCIEditing.tableCIControllerListArea;

    for (int areaNum = 0; areaNum < inputString.length; areaNum++) {
      for (int i = 0; i < inputString[areaNum].length; i++) {
        String removeSpaceText =
            Remove(isIncludeSpace).space(inputString[areaNum][i].text);
        List<String> removeSpaceList = Remove(isIncludeSpace)
            .spaceList(table22.contentsTable22CIIndex[subjectNum - 1][areaNum]);

        if (removeSpaceList.contains(removeSpaceText)) {
          newTextEditor.tableTestCIEditing
              .tableCIControllerAnswerCheckListArea[areaNum][i] = 1;
        } else if (removeSpaceText == '') {
          newTextEditor.tableTestCIEditing
              .tableCIControllerAnswerCheckListArea[areaNum][i] = 0;
        } else {
          newTextEditor.tableTestCIEditing
              .tableCIControllerAnswerCheckListArea[areaNum][i] = 2;
        }
      }
    }
  }

  void tableCheckLowerCategoryAnswer() {
    var inputString = newTextEditor
        .tableTestLowerCategoryEditing.tableLowerCategoryControllerListArea;

    for (int areaNum = 0; areaNum < inputString.length; areaNum++) {
      for (int categoryNum = 0;
          categoryNum < inputString[areaNum].length;
          categoryNum++) {
        for (int i = 0; i < inputString[areaNum][categoryNum].length; i++) {
          String removeSpaceText = Remove(isIncludeSpace)
              .space(inputString[areaNum][categoryNum][i].text);
          String removeSpaceAnswer = Remove(isIncludeSpace).space(
              contentsTable22AreaIndex[subjectNum - 1][areaNum][categoryNum]
                  [i]);

          if (removeSpaceText == removeSpaceAnswer) {
            newTextEditor.tableTestLowerCategoryEditing
                    .tableLowerCategoryControllerAnswerCheckListArea[areaNum]
                [categoryNum][i] = 1;
          } else if (removeSpaceText == '') {
            newTextEditor.tableTestLowerCategoryEditing
                    .tableLowerCategoryControllerAnswerCheckListArea[areaNum]
                [categoryNum][i] = 0;
          } else {
            newTextEditor.tableTestLowerCategoryEditing
                    .tableLowerCategoryControllerAnswerCheckListArea[areaNum]
                [categoryNum][i] = 2;
          }
        }
      }
    }
  }

  void tableCheckValueAnswer() {
    var inputString =
        newTextEditor.tableTestValueEditing.tableValueControllerListArea;

    for (int gradeNum = 0; gradeNum < inputString.length; gradeNum++) {
      for (int areaNum = 0; areaNum < inputString[gradeNum].length; areaNum++) {
        for (int categoryItemNum = 0;
            categoryItemNum < inputString[gradeNum][areaNum].length;
            categoryItemNum++) {
          for (int i = 0;
              i < inputString[gradeNum][areaNum][categoryItemNum].length;
              i++) {
            String removeSpaceText = Remove(isIncludeSpace)
                .space(inputString[gradeNum][areaNum][categoryItemNum][i].text);
            List<String> removeSpaceList = Remove(isIncludeSpace).spaceList(
                contentsTable22ValueIndex[subjectNum - 1][gradeNum][areaNum]
                    [categoryItemNum]);

            if (removeSpaceList.contains(removeSpaceText)) {
              newTextEditor.tableTestValueEditing
                      .tableValueControllerAnswerCheckListArea[gradeNum]
                  [areaNum][categoryItemNum][i] = 1;
            } else if (removeSpaceText == '') {
              newTextEditor.tableTestValueEditing
                      .tableValueControllerAnswerCheckListArea[gradeNum]
                  [areaNum][categoryItemNum][i] = 0;
            } else {
              newTextEditor.tableTestValueEditing
                      .tableValueControllerAnswerCheckListArea[gradeNum]
                  [areaNum][categoryItemNum][i] = 2;
            }
          }
        }
      }
    }
  }
}

class EducationIntroductionCheckAnswer {
  EducationIntroductionTextEditing newTextEditor;
  bool isIncludeSpace;

  EducationIntroductionCheckAnswer(this.newTextEditor, this.isIncludeSpace);

  var educationIntroduction = EducationIntroduction();
  late List<String> inputList = educationIntroduction.educationIntroductionList;

  void educationIntroductionCheckAnswer() {
    for (int i = 0; i < inputList.length; i++) {
      String removeSpaceText = Remove(isIncludeSpace)
          .space(newTextEditor.educationIntroductionControllerList[i].text);
      List<String> removeSpaceList =
          Remove(isIncludeSpace).spaceList(inputList);

      if (removeSpaceText == removeSpaceList[i]) {
        newTextEditor.educationIntroductionCheckList[i] = 1;
      } else if (newTextEditor.educationIntroductionControllerList[i].text ==
          '') {
        newTextEditor.educationIntroductionCheckList[i] = 0;
      } else {
        newTextEditor.educationIntroductionCheckList[i] = 2;
      }
    }
  }
}

class DeleteAnswer {
  RouteContents? routeContents;
  AchieveTextEditing? newAchieveTextEditor;
  TableTextEditing? newTableTextEditor;
  WidgetControl widgetControl;

  DeleteAnswer(
      {this.routeContents,
      this.newTableTextEditor,
      this.newAchieveTextEditor,
      required this.widgetControl});

  late int subjectNum = routeContents!.subjectNum;
  late bool isTableTest = routeContents!.isTableTest;
  late bool isAchieveTest = routeContents!.isAchieveTest;

  void deleteAnswer() {
    if (isTableTest) {
      TableDeleteAnswer(subjectNum, newTableTextEditor!).tableDeleteAnswer();
    } else if (isAchieveTest) {
      AchieveDeleteAnswer(subjectNum, newAchieveTextEditor!)
          .achieveDeleteAnswer();
    }
    newAchieveTextEditor!.notifyListeners();
  }
}

class AchieveDeleteAnswer {
  int subjectNum;
  AchieveTextEditing newTextEditor;

  AchieveDeleteAnswer(this.subjectNum, this.newTextEditor);

  var achieve22 = Achieve22();

  void achieveDeleteAnswer() {
    for (int i = 0; i < newTextEditor.achieveControllerList.length; i++) {
      newTextEditor.achieveControllerList[i].text = '';
      newTextEditor.achieveControllerAnswerCheckList[i] = 0;
    }

    newTextEditor.notifyListeners();
  }
}

class TableDeleteAnswer {
  int subjectNum;
  TableTextEditing newTextEditor;

  TableDeleteAnswer(this.subjectNum, this.newTextEditor);

  var table22 = Achieve22();

  void tableDeleteAnswer() {
    tableTitleDeleteAnswer();
    tableCIDeleteAnswer();
    tableLowerCategoryDeleteAnswer();
    tableValueDeleteAnswer();
    newTextEditor.notifyListeners();
  }

  void tableTitleDeleteAnswer() {
    var inputTitleString =
        newTextEditor.tableTestTitleEditing.tableTitleControllerList;

    for (int i = 0; i < inputTitleString.length; i++) {
      inputTitleString[i].text = '';
      newTextEditor
          .tableTestTitleEditing.tableTitleControllerAnswerCheckList[i] = 0;
    }
  }

  void tableCIDeleteAnswer() {
    var inputCIString =
        newTextEditor.tableTestCIEditing.tableCIControllerListArea;

    for (int areaNum = 0; areaNum < inputCIString.length; areaNum++) {
      for (int i = 0; i < inputCIString[areaNum].length; i++) {
        inputCIString[areaNum][i].text = '';
        newTextEditor.tableTestCIEditing
            .tableCIControllerAnswerCheckListArea[areaNum][i] = 0;
      }
    }
  }

  void tableLowerCategoryDeleteAnswer() {
    var inputLowerCategoryString = newTextEditor
        .tableTestLowerCategoryEditing.tableLowerCategoryControllerListArea;

    for (int areaNum = 0;
        areaNum < inputLowerCategoryString.length;
        areaNum++) {
      for (int categoryNum = 0;
          categoryNum < inputLowerCategoryString[areaNum].length;
          categoryNum++) {
        for (int i = 0;
            i < inputLowerCategoryString[areaNum][categoryNum].length;
            i++) {
          inputLowerCategoryString[areaNum][categoryNum][i].text = '';

          newTextEditor.tableTestLowerCategoryEditing
                  .tableLowerCategoryControllerAnswerCheckListArea[areaNum]
              [categoryNum][i] = 0;
        }
      }
    }
  }

  void tableValueDeleteAnswer() {
    var inputValueString =
        newTextEditor.tableTestValueEditing.tableValueControllerListArea;

    for (int gradeNum = 0; gradeNum < inputValueString.length; gradeNum++) {
      for (int areaNum = 0;
          areaNum < inputValueString[gradeNum].length;
          areaNum++) {
        for (int categoryItemNum = 0;
            categoryItemNum < inputValueString[gradeNum][areaNum].length;
            categoryItemNum++) {
          for (int i = 0;
              i < inputValueString[gradeNum][areaNum][categoryItemNum].length;
              i++) {
            inputValueString[gradeNum][areaNum][categoryItemNum][i].text = '';

            newTextEditor.tableTestValueEditing
                    .tableValueControllerAnswerCheckListArea[gradeNum][areaNum]
                [categoryItemNum][i] = 0;
          }
        }
      }
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
        otherListString[i] = listString[i].replaceAll(' ', '');
      }
      return otherListString;
    }
  }

  String space(String inputString) {
    String otherString = inputString;
    if (isIncludeSpace) {
      return otherString;
    } else {
      String otherString = inputString.replaceAll(' ', '');
      return otherString;
    }
  }
}

import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/answer_check/answer_checker.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';

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
        TableWrongAnswerToDB().tableTitleWrongWrite(subjectNum, table22Area[subjectNum - 1][i]);
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
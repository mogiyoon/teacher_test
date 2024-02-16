import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/answer_check/answer_checker.dart';
import 'package:teacher_test/function/answer_check/answer_to_db.dart';
import 'package:teacher_test/test/achieve_builder.dart';

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

  void achieveCheckAnswer() {
    var inputString = newTextEditor.achieveControllerListArea;

    for (int gradeNum = 0; gradeNum < 3; gradeNum++) {
      for (int i = 0; i < inputString[gradeNum].length; i++) {
        String removeSpaceText =
        Remove(isIncludeSpace).space(inputString[gradeNum][i].text);
        if ((achieveIndex[gradeNum]).contains(removeSpaceText)) {
          newTextEditor.achieveControllerAnswerCheckListArea[gradeNum][i] = 1;
        } else if (inputString[gradeNum][i].text == '') {
          newTextEditor.achieveControllerAnswerCheckListArea[gradeNum][i] = 0;
        } else {
          AchieveWrongAnswerToDB().achieveWriter(subjectNum, gradeNum,
              achieve22.contentsAchieve22Index[subjectNum - 1][gradeNum][i]);
          newTextEditor.achieveControllerAnswerCheckListArea[gradeNum][i] = 2;
        }
      }
    }
  }
}

class AchieveDeleteAnswer {
  int subjectNum;
  AchieveTextEditing newTextEditor;

  AchieveDeleteAnswer(this.subjectNum, this.newTextEditor);

  var achieve22 = Achieve22();

  void achieveDeleteAnswer() {
    for (int gradeNum = 0;
    gradeNum < newTextEditor.achieveControllerListArea.length;
    gradeNum++) {
      for (int i = 0;
      i < newTextEditor.achieveControllerListArea[gradeNum].length;
      i++) {
        newTextEditor.achieveControllerListArea[gradeNum][i].text = '';
        newTextEditor.achieveControllerAnswerCheckListArea[gradeNum][i] = 0;
      }
    }

    newTextEditor.notifyListeners();
  }
}
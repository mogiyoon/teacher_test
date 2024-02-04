import 'package:flutter/material.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';

class CheckAnswer {
  AchieveTextEditing newTextEditor;
  int subjectNum;
  bool isTableTest;
  bool isAchieveTest;

  CheckAnswer(this.subjectNum, this.isTableTest, this.isAchieveTest,
      this.newTextEditor);

  void checkAnswer() {
    if (isTableTest) {
      TableCheckAnswer().tableCheckAnswer();
    }
    else if (isAchieveTest) {
      AchieveCheckAnswer(subjectNum, newTextEditor).achieveCheckAnswer();
    }
    newTextEditor.notifyListeners();
  }
}

class AchieveCheckAnswer{
  int subjectNum;
  AchieveTextEditing newTextEditor;
  AchieveCheckAnswer(this.subjectNum, this.newTextEditor);

  var achieve22 = Achieve22();
  late List<String> oneTwoAchieve = RemoveSpaceList()
      .removeSpaceList((achieve22.contentsAchieve22Index[subjectNum - 1])[0]);
  late List<String> threeFourAchieve = RemoveSpaceList()
      .removeSpaceList((achieve22.contentsAchieve22Index[subjectNum - 1])[1]);
  late List<String> fiveSixAchieve = RemoveSpaceList()
      .removeSpaceList((achieve22.contentsAchieve22Index[subjectNum - 1])[2]);

  late List<List<String>> achieveIndex = [
    oneTwoAchieve, threeFourAchieve, fiveSixAchieve];

  late List<int> achieveLengthIndex = [
    0,
    oneTwoAchieve.length,
    (oneTwoAchieve.length + threeFourAchieve.length),
    (oneTwoAchieve.length + threeFourAchieve.length + fiveSixAchieve.length),
  ];

  void achieveCheckAnswer() {
    for (int j = 0; j < 3; j++) {
      for (int i = achieveLengthIndex[j]; i < achieveLengthIndex[j + 1]; i++) {
        achieveCheckFunction(i, j);
      }
    }
  }

  void achieveCheckFunction(int i, int j) {
    String removeSpaceText = (newTextEditor.achieveControllerList[i].text).replaceAll(' ', '');
    // j=0 : 1~2, j=1 : 3~4, j=2 : 5~6
    if ((achieveIndex[j]).contains(removeSpaceText)) {
      newTextEditor.achieveControllerAnswerCheckList[i] = 1;
    }
    else if (newTextEditor.achieveControllerList[i].text == '') {
      newTextEditor.achieveControllerAnswerCheckList[i] = 0;
    }
    else {
      newTextEditor.achieveControllerAnswerCheckList[i] = 2;
    }
  }
}

class TableCheckAnswer{
  void tableCheckAnswer() {
  }
}

class DeleteAnswer {
  int subjectNum;
  AchieveTextEditing newTextEditor;
  DeleteAnswer(this.subjectNum, this.newTextEditor);

  var achieve22 = Achieve22();

  void deleteAnswer() {
    for(int i = 0; i<(achieve22.contentsAchieve22[subjectNum-1]).length; i++){
      newTextEditor.achieveControllerList[i].text = '';
      newTextEditor.achieveControllerAnswerCheckList[i] = 0;
    }

    newTextEditor.notifyListeners();
  }
}

class RemoveSpaceList {
  List<String> removeSpaceList(List<String> listString) {
    List<String> otherListString = listString;
    for(int i = 0; i < listString.length; i++) {
      otherListString[i] = listString[i].replaceAll(' ', '');
    }
    return otherListString;
  }
}

class ColorContainer extends StatelessWidget {
  Color containerColor;
  ColorContainer(this.containerColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: containerColor,
      ),
    );
  }
}

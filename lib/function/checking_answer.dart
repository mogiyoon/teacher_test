import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/test_screen.dart';

class CheckAnswerFloat extends StatelessWidget {
  const CheckAnswerFloat({super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    bool isTableTest = routeContents.isTableTest;
    bool isAchieveTest = routeContents.isAchieveTest;

    var newTextEditor = Provider.of<AchieveTextEditing>(context);

    var checkAnswer = CheckAnswer(subjectNum, isTableTest, isAchieveTest, newTextEditor);

    return FloatingActionButton(
        onPressed: () => checkAnswer.checkAnswer(),
        tooltip: '정답 확인',
        child: const Icon(Icons.check)
    );
  }
}

class CheckAnswer {
  AchieveTextEditing newTextEditor;
  int subjectNum;
  bool isTableTest;
  bool isAchieveTest;
  CheckAnswer(this.subjectNum, this.isTableTest, this.isAchieveTest, this.newTextEditor);

  var achieve22 = Achieve22();
  late List<String> oneTwoAchieve = (achieve22.contentsAchieve22Index[subjectNum-1])[0];
  late List<String> threeFourAchieve = (achieve22.contentsAchieve22Index[subjectNum-1])[1];
  late List<String> fiveSixAchieve = (achieve22.contentsAchieve22Index[subjectNum-1])[2];

  void checkAnswer() {
    if(isTableTest) {
    }
    else if(isAchieveTest) {
      for(int i = 0; i < achieve22.contentsAchieve22[subjectNum - 1].length; i++) {
        if ((achieve22.contentsAchieve22[subjectNum - 1]).contains(newTextEditor.controllerList[i].text)) {
          newTextEditor.controllerAnswerCheckList[i] = 1;
          print (true);
        }
        else if(newTextEditor.controllerList[i].text == '') {
          newTextEditor.controllerAnswerCheckList[i] = 0;
        }
        else {
          newTextEditor.controllerAnswerCheckList[i] = 2;
          print (false);
        }
      }
    }
    newTextEditor.notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/test_screen.dart';

class MultiFloatButton extends StatelessWidget {
  const MultiFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    bool isTableTest = routeContents.isTableTest;
    bool isAchieveTest = routeContents.isAchieveTest;

    var newTextEditor = Provider.of<AchieveTextEditing>(context);

    var checkAnswer =
        CheckAnswer(subjectNum, isTableTest, isAchieveTest, newTextEditor);
    var deleteAnswer =
        DeleteAnswer(subjectNum, newTextEditor);

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: Colors.deepPurple.shade300,
      children: [
        SpeedDialChild(
            child: Icon(Icons.check),
            onTap: () => checkAnswer.checkAnswer(),
            backgroundColor: Colors.deepPurple.shade100,
            shape: CircleBorder(),
        ),
        SpeedDialChild(
            onTap: () => deleteAnswer.deleteAnswer(),
            child: const Icon(Icons.delete),
            backgroundColor: Colors.deepPurple.shade100,
            shape: CircleBorder(),

        ),
      ],
    );
  }
}

class CheckAnswer {
  AchieveTextEditing newTextEditor;
  int subjectNum;
  bool isTableTest;
  bool isAchieveTest;

  CheckAnswer(this.subjectNum, this.isTableTest, this.isAchieveTest,
      this.newTextEditor);

  var achieve22 = Achieve22();
  late List<String> oneTwoAchieve =
      (achieve22.contentsAchieve22Index[subjectNum - 1])[0];
  late List<String> threeFourAchieve =
      (achieve22.contentsAchieve22Index[subjectNum - 1])[1];
  late List<String> fiveSixAchieve =
      (achieve22.contentsAchieve22Index[subjectNum - 1])[2];

  void checkAnswer() {
    if (isTableTest) {
    } else if (isAchieveTest) {
      for (int i = 0;
          i < achieve22.contentsAchieve22[subjectNum - 1].length;
          i++) {
        if ((achieve22.contentsAchieve22[subjectNum - 1])
            .contains(newTextEditor.controllerList[i].text)) {
          newTextEditor.controllerAnswerCheckList[i] = 1;
        } else if (newTextEditor.controllerList[i].text == '') {
          newTextEditor.controllerAnswerCheckList[i] = 0;
        } else {
          newTextEditor.controllerAnswerCheckList[i] = 2;
        }
      }
    }
    newTextEditor.notifyListeners();
  }
}

class DeleteAnswer {
  int subjectNum;
  AchieveTextEditing newTextEditor;
  DeleteAnswer(this.subjectNum, this.newTextEditor);

  var achieve22 = Achieve22();

  void deleteAnswer() {
    for(int i = 0; i<(achieve22.contentsAchieve22[subjectNum-1]).length; i++){
      newTextEditor.controllerList[i].text = '';
      newTextEditor.controllerAnswerCheckList[i] = 0;
    }

    newTextEditor.notifyListeners();
  }
}
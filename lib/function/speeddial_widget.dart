import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/answer_checker.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/test_screen.dart';

class MultiFloatButton extends StatelessWidget {
  const MultiFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    bool isTableTest = routeContents.isTableTest;
    bool isAchieveTest = routeContents.isAchieveTest;

    var newAchieveTextEditor = Provider.of<AchieveTextEditing>(context);
    var newTableTextEditor = Provider.of<TableTextEditing>(context);

    var checkAnswer = CheckAnswer(subjectNum, isTableTest, isAchieveTest,
        newAchieveTextEditor, newTableTextEditor);
    var deleteAnswer = DeleteAnswer(subjectNum, isTableTest, isAchieveTest,
        newAchieveTextEditor, newTableTextEditor);

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

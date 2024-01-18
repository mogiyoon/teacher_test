import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/test_screen.dart';

class CheckAnswer with ChangeNotifier {
  int subjectNum;
  bool isTableTest;
  bool isAchieveTest;
  CheckAnswer(this.subjectNum, this.isTableTest, this.isAchieveTest);
  var achieve22 = Achieve22();

  late var achieveFormBuiler = AchieveFormBuilder((achieve22.contentsAchieve22Index[subjectNum-1])[0]);

  void checkAnswer() {
    if(isTableTest) {
    }
    else if(isAchieveTest) {
      late List<String> oneTwoAchieve = (achieve22.contentsAchieve22Index[subjectNum-1])[0];
      late List<String> threeFourAchieve = (achieve22.contentsAchieve22Index[subjectNum-1])[1];
      late List<String> fiveSixAchieve = (achieve22.contentsAchieve22Index[subjectNum-1])[2];
    }
  }
}

class CheckAnswerFloat extends StatelessWidget {
  const CheckAnswerFloat({super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of(context);
    int subjectNum = routeContents.subjectNum;
    bool isTableTest = routeContents.isTableTest;
    bool isAchieveTest = routeContents.isAchieveTest;
    var checkAnswer = CheckAnswer(subjectNum, isTableTest, isAchieveTest);

    return FloatingActionButton(
        onPressed: () => checkAnswer.checkAnswer(),
        tooltip: '정답 확인',
        child: const Icon(Icons.check)
    );
  }
}

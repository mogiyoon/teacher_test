import 'package:flutter/material.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/test_screen.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:provider/provider.dart';

class AchieveTestChoiceBuilder extends StatelessWidget {
  const AchieveTestChoiceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var testChoice = Provider.of<TestChoice>(context);
    bool isTest = testChoice.isTest;

    var gradeChoice = Provider.of<GradeChoice>(context);
    bool isOneTwoCheck = gradeChoice.isOneTwoCheck;
    bool isThreeFourCheck = gradeChoice.isThreeFourCheck;
    bool isFiveSixCheck = gradeChoice.isFiveSixCheck;

    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;

    var achieve22 = Achieve22();

    return Column(
      //['국어', '수학', '사회', '과학', '영어', '체육', '미술', '음악', '도덕', '실과', '통합']
      //[Subject][OneTwoCheck:0, ThreeFourCheck:1, FiveSixCheck:2]
      children: [
        if (isTest) ...[
          if (isOneTwoCheck)
            AchieveFormBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[0], 0, subjectNum),
          if (isThreeFourCheck)
            AchieveFormBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[1], 1, subjectNum),
          if (isFiveSixCheck)
            AchieveFormBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[2], 2, subjectNum),
        ],
        if (!isTest) ...[
          if (isOneTwoCheck)
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[0]),
          if (isThreeFourCheck)
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[1]),
          if (isFiveSixCheck)
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[2]),
        ],
        Container(
          height: 5,
        )
      ],
    );
  }
}

class AchieveTextBuilder extends StatelessWidget {
  List<String> AchieveList;

  AchieveTextBuilder(this.AchieveList);

  @override
  Widget build(BuildContext context) {
    double heightConst = (AchieveList.length).toDouble();

    return Container(
      height: 50 * (heightConst),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              child: Text(AchieveList[index]),
            );
          }),
    );
  }
}

class AchieveFormBuilder extends StatelessWidget {
  List<String> AchieveList;
  int grade; // 0: 1~2, 1: 3~4, 2: 5~6
  int subjectNum;
  AchieveFormBuilder(this.AchieveList, this.grade, this.subjectNum);

  var achieve22 = Achieve22();
  late int grade12Length = ((achieve22.contentsAchieve22Index[subjectNum - 1])[0]).length;
  late int grade34Length = ((achieve22.contentsAchieve22Index[subjectNum - 1])[1]).length;
  int realIndex = -1;

  @override
  Widget build(BuildContext context) {
    double heightConst = (AchieveList.length).toDouble();
    var formList = Provider.of<AchieveTextEditing>(context);
    var controllerList = formList.controllerList;
    if (grade == 0) realIndex = -1;
    if (grade == 1) realIndex = grade12Length - 1;
    if (grade == 2) realIndex = (grade12Length + grade34Length) - 1;

    return Container(
      height: 50 * (heightConst),
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index) {
            realIndex++;
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        controller: controllerList[realIndex],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (formList.controllerAnswerCheckList[realIndex] == 0)
                            ColorContainer(Colors.white),
                          if (formList.controllerAnswerCheckList[realIndex] == 1)
                            ColorContainer(Colors.green.shade200),
                          if (formList.controllerAnswerCheckList[realIndex] == 2)
                            ColorContainer(Colors.red.shade200)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}

class AchieveTextEditing with ChangeNotifier {
  int listLength;

  AchieveTextEditing(this.listLength);

  late List<TextEditingController> controllerList =
      List.generate(listLength, (i) => TextEditingController());
  late List<int> controllerAnswerCheckList =
      List.generate(listLength, (i) => 0);
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


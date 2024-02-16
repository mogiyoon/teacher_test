import 'package:flutter/material.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/widget/spatial_widget.dart';
import 'package:teacher_test/function/widget/text_widget.dart';
import 'package:teacher_test/function/text-sorted_combined.dart';
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
          if (isOneTwoCheck) ...[
            Center(
              child: TextSorterOneTwo(),
            ),
            AchieveFormBuilder(0),
          ],
          if (isThreeFourCheck) ...[
            Center(
              child: TextSorterThreeFour(),
            ),
            AchieveFormBuilder(1)
          ],
          if (isFiveSixCheck) ...[
            Center(
              child: TextSorterFiveSix(),
            ),
            AchieveFormBuilder(2)
          ]
        ],
        if (!isTest) ...[
          if (isOneTwoCheck) ...[
            Center(
              child: TextSorterOneTwo(),
            ),
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[0]),
          ],
          if (isThreeFourCheck) ...[
            Center(
              child: TextSorterThreeFour(),
            ),
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[1]),
          ],
          if (isFiveSixCheck) ...[
            Center(
              child: TextSorterFiveSix(),
            ),
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[2]),
          ]
        ],
        Container(
          height: 5,
        )
      ],
    );
  }
}

class AchieveTextBuilder extends StatelessWidget {
  List<String> achieveList;

  AchieveTextBuilder(this.achieveList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.all(30),
        itemCount: achieveList.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(6),
              child: CopyWithText(achieveList[index]));
        });
  }
}

class AchieveFormBuilder extends StatelessWidget {
  int grade; // 0: 1~2, 1: 3~4, 2: 5~6

  AchieveFormBuilder(this.grade);

  var achieve22 = Achieve22();

  @override
  Widget build(BuildContext context) {
    var formList = Provider.of<AchieveTextEditing>(context);
    var achieveControllerList = formList.achieveControllerListArea;

    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30),
          itemCount: achieveControllerList[grade].length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        controller: achieveControllerList[grade][index],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (formList.achieveControllerAnswerCheckListArea[
                                  grade][index] ==
                              0)
                            ColorContainer(Colors.white),
                          if (formList.achieveControllerAnswerCheckListArea[
                                  grade][index] ==
                              1)
                            ColorContainer(Colors.green.shade200),
                          if (formList.achieveControllerAnswerCheckListArea[
                                  grade][index] ==
                              2)
                            ColorContainer(Colors.red.shade200)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CopyContainer(achieveControllerList[grade][index]),
                    ),
                    Container(
                      width: 30,
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }
}

class AchieveTextEditing with ChangeNotifier {
  int subjectNum;

  AchieveTextEditing(this.subjectNum);

  var achieve22 = Achieve22();

  late List<List<TextEditingController>> achieveControllerListArea =
      List.generate(3, (gradeNum) {
    return (List.generate(
        achieve22.contentsAchieve22[subjectNum - 1][gradeNum].length,
        (index) => TextEditingController()));
  });
  late List<List<int>> achieveControllerAnswerCheckListArea =
      List.generate(3, (gradeNum) {
    return (List.generate(
        achieve22.contentsAchieve22[subjectNum - 1][gradeNum].length,
        (index) => 0));
  });
}

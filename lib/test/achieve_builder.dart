import 'package:flutter/material.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/container_widget.dart';
import 'package:teacher_test/function/gesture_function.dart';
import 'package:teacher_test/function/widget_control.dart';
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
            Center(child: TextSorterOneTwo(),),
            AchieveFormBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[0], 0,
                subjectNum),
          ],
          if (isThreeFourCheck) ...[
            Center(child: TextSorterThreeFour(),),
            AchieveFormBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[1], 1,
                subjectNum),
          ],
          if (isFiveSixCheck) ...[
            Center(child: TextSorterFiveSix(),),
            AchieveFormBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[2], 2,
                subjectNum),
          ]
        ],
        if (!isTest) ...[
          if (isOneTwoCheck) ...[
            Center(child: TextSorterOneTwo(),),
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[0]),
          ],
          if (isThreeFourCheck) ...[
            Center(child: TextSorterThreeFour(),),
            AchieveTextBuilder(
                (achieve22.contentsAchieve22Index[subjectNum - 1])[1]),
          ],
          if (isFiveSixCheck) ...[
            Center(child: TextSorterFiveSix(),),
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
  List<String> AchieveList;

  AchieveTextBuilder(this.AchieveList);

  @override
  Widget build(BuildContext context) {
    var widgetSetting = Provider.of<WidgetControl>(context);
    double widgetMediumFontSize = widgetSetting.widgetFontSize.mediumFontSize;

    return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: EdgeInsets.all(30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              child: CopyWithText(AchieveList[index],
                  style: TextStyle(fontSize: widgetMediumFontSize))
              //Todo : 눌렀을 때 클립보드에 복사 => 오류찾기에 이용
            );
          });
  }
}

class AchieveFormBuilder extends StatelessWidget {
  List<String> AchieveList;
  int grade; // 0: 1~2, 1: 3~4, 2: 5~6
  int subjectNum;

  AchieveFormBuilder(this.AchieveList, this.grade, this.subjectNum);

  var achieve22 = Achieve22();
  late int grade12Length = ((achieve22.contentsAchieve22Index[subjectNum -
      1])[0]).length;
  late int grade34Length = ((achieve22.contentsAchieve22Index[subjectNum -
      1])[1]).length;
  int realIndex = -1;

  @override
  Widget build(BuildContext context) {
    var formList = Provider.of<AchieveTextEditing>(context);
    var achieveControllerList = formList.achieveControllerList;
    if (grade == 0) realIndex = -1;
    if (grade == 1) realIndex = grade12Length - 1;
    if (grade == 2) realIndex = (grade12Length + grade34Length) - 1;

    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          shrinkWrap: true,
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
                        controller: achieveControllerList[realIndex],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (formList
                              .achieveControllerAnswerCheckList[realIndex] == 0)
                            ColorContainer(Colors.white),
                          if (formList
                              .achieveControllerAnswerCheckList[realIndex] == 1)
                            ColorContainer(Colors.green.shade200),
                          if (formList
                              .achieveControllerAnswerCheckList[realIndex] == 2)
                            ColorContainer(Colors.red.shade200)
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
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

  late List<TextEditingController> achieveControllerList =
  List.generate(achieve22.contentsAchieve22[subjectNum - 1].length, (i) =>
      TextEditingController());
  late List<int> achieveControllerAnswerCheckList =
  List.generate(achieve22.contentsAchieve22[subjectNum - 1].length, (i) => 0);
}

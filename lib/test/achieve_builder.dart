import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return ChangeNotifierProvider<NewTextEditing>.value(
      value: NewTextEditing(
          (achieve22.contentsAchieve22Index[subjectNum - 1])[0] +
          achieve22.contentsAchieve22Index[subjectNum - 1])[1] +
        achieve22.contentsAchieve22Index[subjectNum - 1])[2])
      ),
      child: Column(
        //['국어', '수학', '사회', '과학', '영어', '체육', '미술', '음악', '도덕', '실과', '통합']
        //[TableOrAchieve][Subject][OneTwoCheck:0, ThreeFourCheck:1, FiveSixCheck:2]
        children: [
          if (isTest) ...[
            if (isOneTwoCheck)
              AchieveFormBuilder(
                  (achieve22.contentsAchieve22Index[subjectNum - 1])[0]),
            if (isThreeFourCheck)
              AchieveFormBuilder(
                  (achieve22.contentsAchieve22Index[subjectNum - 1])[1]),
            if (isFiveSixCheck)
              AchieveFormBuilder(
                  (achieve22.contentsAchieve22Index[subjectNum - 1])[2]),
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
        ],
      ),
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

  AchieveFormBuilder(this.AchieveList);

  @override
  Widget build(BuildContext context) {
    double heightConst = (AchieveList.length).toDouble();
    var FormList = NewTextEditing(AchieveList.length);

    return Container(
      height: 50 * (heightConst),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  width: 800,
                  child: TextFormField(
                    key: ValueKey(index.toString()),
                    controller: FormList.Controller(index),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => FormList.PrintValue(index),
                  child: Text('print'),
                ),
              ],
            );
          }),
    );
  }
}

class NewTextEditing with ChangeNotifier {

  int listLength;
  late List<TextEditingController> controllerList;

  NewTextEditing(this.listLength);

  TextEditingController Controller(int index) {
    controllerList = List.generate(listLength, (i) => TextEditingController());
    print(controllerList[index]);
    return controllerList[index];
  }

  void PrintValue(int index) {
    print(controllerList[index]);
    print('${controllerList[index].text}');
  }
}

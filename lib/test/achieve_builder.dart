import 'package:flutter/material.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/test_screen.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:provider/provider.dart';

class ChoiceBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    bool isTableTest = routeContents.isTableTest;
    bool isAchieveTest = routeContents.isAchieveTest;

    var gradeChoice = Provider.of<GradeChoice>(context);
    bool isOneTwoCheck = gradeChoice.isOneTwoCheck;
    bool isThreeFourCheck = gradeChoice.isThreeFourCheck;
    bool isFiveSixCheck = gradeChoice.isFiveSixCheck;

    var testChoice = Provider.of<TestChoice>(context);
    bool isTest = testChoice.isTest;

    return Column(

    );
  }
}


class TextBuilder extends StatelessWidget {
  List<String> AchieveList;
  TextBuilder(this.AchieveList);

  @override
  Widget build(BuildContext context) {
    double heightConst = (AchieveList.length).toDouble();

    return Container(
      height: 50*(heightConst),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index){
            return  Container(
              height: 50,
              child: Text(AchieveList[index]),
            );
          }
      ),
    );
  }
}

class FormBuilder extends StatelessWidget {
  List<String> AchieveList;
  FormBuilder(this.AchieveList);

  @override
  Widget build(BuildContext context) {
    double heightConst = (AchieveList.length).toDouble();

    return Container(
      height: 50*(heightConst),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index){
            return Form(
              key: ValueKey(index.toString()),
              child: TextFormField(),
            );
          }
      ),
    );
  }
}

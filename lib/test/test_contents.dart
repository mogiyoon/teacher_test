import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/text-sorted_combined.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/table/table_builder.dart';
import 'package:teacher_test/test/test_screen.dart';

class ChoiceContents extends StatefulWidget {
  const ChoiceContents({super.key});

  @override
  State<ChoiceContents> createState() => _ChoiceContentsState();
}

class _ChoiceContentsState extends State<ChoiceContents> {
  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    bool isTableTest = routeContents.isTableTest;
    bool isAchieveTest = routeContents.isAchieveTest;

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<GradeChoice>.value(value: GradeChoice()),
          ChangeNotifierProvider<TestChoice>.value(value: TestChoice()),
        ],
        child: Column(children: [
          ExpansionTile(
            title: Center(child: Text('학년군/과목 선택')),
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TestCheckBoxWidget(),
                    Text('시험'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradeCheckBoxWidget(TextSorterOneTwo(), 1),
                  GradeCheckBoxWidget(TextSorterThreeFour(), 3),
                  GradeCheckBoxWidget(TextSorterFiveSix(), 5)
                ],
              )
            ],
          ),
          Expanded( //TODO 스크롤 중 새로운 터치가 있을 때 InteractiveViewer로 전환 -- 비동기 사용?
            child: SingleChildScrollView(
              child: Column(children: [
                if (isTableTest) TableTestChoiceBuilder(),
                if (isAchieveTest) AchieveTestChoiceBuilder()
              ]),
            ),
          )
        ]));
  }
}

class TestChoice extends ChangeNotifier {
  bool _isTest = false;

  bool get isTest => _isTest;

  set isTest(bool value) {
    _isTest = value;
  }

  void testCheckFun(bool value) {
    isTest = value;
    notifyListeners();
  }
}

class TestCheckBoxWidget extends StatelessWidget {
  const TestCheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var testChoice = Provider.of<TestChoice>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: testChoice.isTest,
            onChanged: (bool? value) {
              testChoice.isTest = value ?? false;
              testChoice.testCheckFun(testChoice.isTest);
            })
      ],
    );
  }
}

class GradeChoice extends ChangeNotifier {
  bool _isOneTwoCheck = false;

  bool get isOneTwoCheck => _isOneTwoCheck;

  set isOneTwoCheck(bool value) {
    _isOneTwoCheck = value;
  }

  bool _isThreeFourCheck = false;

  bool get isThreeFourCheck => _isThreeFourCheck;

  set isThreeFourCheck(bool value) {
    _isThreeFourCheck = value;
  }

  bool _isFiveSixCheck = false;

  bool get isFiveSixCheck => _isFiveSixCheck;

  set isFiveSixCheck(bool value) {
    _isFiveSixCheck = value;
  }

  void oneTwoCheckFun(bool value) {
    isOneTwoCheck = value;
    notifyListeners();
  }

  void threeFourCheckFun(bool value) {
    isThreeFourCheck = value;
    notifyListeners();
  }

  void fiveSixCheckFun(bool value) {
    isFiveSixCheck = value;
    notifyListeners();
  }
}

class GradeCheckBoxWidget extends StatelessWidget {
  Widget widget;
  int grade;

  GradeCheckBoxWidget(this.widget, this.grade);

  bool changeValue = false;

  @override
  Widget build(BuildContext context) {
    var gradeChoice = Provider.of<GradeChoice>(context);

    return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: changeValue,
                onChanged: (bool? value) {
                  changeValue = value ?? false;
                  switch (grade) {
                    case 1:
                      gradeChoice.oneTwoCheckFun(changeValue);
                    case 3:
                      gradeChoice.threeFourCheckFun(changeValue);
                    case 5:
                      gradeChoice.fiveSixCheckFun(changeValue);
                  }
                }),
            widget,
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/test/test_screen.dart';
import 'package:teacher_test/test/achieve_builder.dart';

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

    return Checkbox(
        value: testChoice.isTest,
        onChanged: (bool? value) {
          testChoice.isTest = value ?? false;
          testChoice.testCheckFun(testChoice.isTest);
        });
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
  String title;
  int grade;

  GradeCheckBoxWidget(this.title, this.grade);

  bool changeValue = false;

  @override
  Widget build(BuildContext context) {
    var gradeChoice = Provider.of<GradeChoice>(context);

    return Expanded(
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
        Text(title),
      ],
    ));
  }
}

class TestContents extends StatefulWidget {
  const TestContents({super.key});

  @override
  State<TestContents> createState() => _TestContentsState();
}

class _TestContentsState extends State<TestContents> {
  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    return Container(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<GradeChoice>.value(value: GradeChoice()),
          ChangeNotifierProvider<TestChoice>.value(value: TestChoice()),
        ],
        child: Column(children: [
          ExpansionTile(title: Center(child: Text('학년군 선택')), children: [
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [TestCheckBoxWidget(), Text('시험')],
                )),
            Row(
              children: [
                GradeCheckBoxWidget('1~2학년군', 1),
                GradeCheckBoxWidget('3~4학년군', 3),
                GradeCheckBoxWidget('5~6학년군', 5)
              ],
            )
          ]),
          Expanded(child: SingleChildScrollView(child: AchieveTestChoiceBuilder())),
        ]),
      ),
    );
  }
}

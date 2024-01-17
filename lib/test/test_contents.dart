import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/test/test_screen.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/achieve_builder.dart';

class Choice extends ChangeNotifier {
  bool _oneTwoCheck = false;

  bool get oneTwoCheck => _oneTwoCheck;

  set oneTwoCheck(bool value) {
    _oneTwoCheck = value;
  }

  bool _threeFourCheck = false;

  bool get threeFourCheck => _threeFourCheck;

  set threeFourCheck(bool value) {
    _threeFourCheck = value;
  }

  bool _fiveSixCheck = false;

  bool get fiveSixCheck => _fiveSixCheck;

  set fiveSixCheck(bool value) {
    _fiveSixCheck = value;
  }

  void oneTwoCheckFun(bool value) {
    oneTwoCheck = value;
    notifyListeners();
  }

  void threeFourCheckFun(bool value) {
    threeFourCheck = value;
    notifyListeners();
  }

  void fiveSixCheckFun(bool value) {
    fiveSixCheck = value;
    notifyListeners();
  }
}

class TestTable extends StatefulWidget {
  const TestTable({super.key});

  @override
  State<TestTable> createState() => _TestTableState();
}

class _TestTableState extends State<TestTable> {
  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    return Container(
        child: ChangeNotifierProvider<Choice>.value(
      value: Choice(),
        child: Column(
          children: [
            Row(
              children: [
                CheckBoxWidget('1~2학년군', 1),
                CheckBoxWidget('3~4학년군', 3),
                CheckBoxWidget('5~6학년군', 5)
              ],
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                    child: ContentsWidget()
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  String title;
  int grade;

  CheckBoxWidget(this.title, this.grade);

  bool changeValue = false;

  @override
  Widget build(BuildContext context) {
    var choice = Provider.of<Choice>(context);

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
                  choice.oneTwoCheckFun(changeValue);
                case 3:
                  choice.threeFourCheckFun(changeValue);
                case 5:
                  choice.fiveSixCheckFun(changeValue);
              }
            }),
        Text(title),
      ],
    ));
  }
}

class ContentsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    var choice = Provider.of<Choice>(context);
    var koreanAchieve22 = KoreanAchieve22();

    return Column(
      children: [
        if (choice.oneTwoCheck)
          FormBuilder(koreanAchieve22.koreanAchieve12),
        if (choice.threeFourCheck)
          FormBuilder(koreanAchieve22.koreanAchieve34),
        if (choice.fiveSixCheck)
          FormBuilder(koreanAchieve22.koreanAchieve56)
      ],
    );
  }
}

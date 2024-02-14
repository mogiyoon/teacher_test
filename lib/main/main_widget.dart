import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/answer_checker.dart';
import 'package:teacher_test/function/text_widget.dart';
import 'package:teacher_test/setting/widget_control.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery
        .of(context)
        .size
        .width * 0.08;

    return Column(children: [
      if (TimeCalculator().dDay > 0)
        Column(
          children: [
            Text(
              '시험까지',
              style: TextStyle(fontSize: size),
            ),
            Text(
              '${TimeCalculator().dDay} 일!',
              style: TextStyle(fontSize: size),
            ),
          ],
        ),
      if (TimeCalculator().dDay == 0)
        Text(
          'D - Day',
          style: TextStyle(fontSize: size * 1.5),
        ),
    ]);
  }
}

class TimeCalculator {
  final now = DateTime.now();
  late final year = now.year;
  late final month = now.month;
  late final day = now.day;
  late int dDay = 0;

  var novemberFirst;
  late int firstDay;
  late var testYear = year;

  var testDate;

  TimeCalculator() {
    TestDateProduction();

    if (month > 11) {
      testYear = testYear + 1;
      TestDateProduction();
    } else if (month == 11) {
      if (day >= testDate.day) {
        testYear = testYear + 1;
        TestDateProduction();
      }
    }

    dDay = testDate
        .difference(now)
        .inDays;
  }

  void TestDateProduction() {
    novemberFirst = DateTime(testYear, 11, 1);
    firstDay = novemberFirst.weekday;
    if (firstDay == DateTime.sunday) {
      testDate = DateTime(testYear, 11, 7);
    } else {
      testDate = DateTime(testYear, 11, ((7 - firstDay) + 8));
    }
  }
}

class ErrorFinder extends StatelessWidget {
  const ErrorFinder({super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControlProvider>(context);
    TextEditingController firstController = TextEditingController();
    firstController.text = '원문 : ${widgetControl.clipBoard.copyStringFirst}';
    TextEditingController secondController = TextEditingController();
    secondController.text = '비교 : ${widgetControl.clipBoard.copyStringSecond}';

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                decoration: InputDecoration(isDense: true),
                style: TextStyle(
                    fontSize: widgetControl.widgetFontSize.mediumFontSize),
                controller: firstController,
              )),
          Container(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                decoration: InputDecoration(isDense: true),
                style: TextStyle(
                    fontSize: widgetControl.widgetFontSize.mediumFontSize),
                controller: secondController,
              )),
          Container(
            height: widgetControl.widgetFontSize.mediumFontSize * 3,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(top: 8, left: 4, right: 4),
            decoration: BoxDecoration(border: Border.all()),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: BoolContainerGenerator(),
          )
        ],
      ),
    );
  }
}

class BoolContainerGenerator extends StatelessWidget {
  const BoolContainerGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControlProvider>(context);
    var clipBoard = widgetControl.clipBoard;
    var isIncludeSpace = widgetControl.spaceSwitch.isIncludeSpace;
    List<bool> returnCompareResult =
    MainAnswerChecker().returnCompareResult(clipBoard, isIncludeSpace);
    String modifiedString = MainAnswerChecker().returnModifiedString(
        clipBoard, isIncludeSpace);
    final ListScrollController = ScrollController();

    return Scrollbar(
      thickness: 5,
      controller: ListScrollController,
      child: ListView.builder(
        controller: ListScrollController,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: modifiedString.length,
        itemBuilder: (context, index) {
          return SelectableText(
            modifiedString[index],
            style: TextStyle(
              fontSize: widgetControl.widgetFontSize.mediumFontSize,
              backgroundColor: returnCompareResult[index]
                  ? Colors.green.shade200
                  : Colors.red.shade200,
            ),
          );
        },
      ),
    );
  }
}

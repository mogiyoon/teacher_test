import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/db/wrong_answer_list_db.dart';
import 'package:teacher_test/function/answer_check/main_checker.dart';
import 'package:teacher_test/setting/widget_control.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.08;

    return Column(children: [
      if (TimeCalculator().dDay >= 281)
        Text(
          '고생하셨습니다!',
          style: TextStyle(fontSize: size * 1.5),
        ),
      if (TimeCalculator().dDay > 0 && TimeCalculator().dDay < 281)
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

    dDay = testDate.difference(now).inDays;
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
            width: MediaQuery.of(context).size.width,
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
    String modifiedString =
        MainAnswerChecker().returnModifiedString(clipBoard, isIncludeSpace);
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

class WhatIsWrongListView extends StatefulWidget {
  const WhatIsWrongListView({super.key});

  @override
  State<WhatIsWrongListView> createState() => _WhatIsWrongListViewState();
}

class _WhatIsWrongListViewState extends State<WhatIsWrongListView> {
  @override
  Widget build(BuildContext context) {
    final ListScrollController = ScrollController();
    Map<String, dynamic> wrongAnswerMap = WrongAnswerBox().readWrongAnswerMap();
    List<dynamic> sortedKey =
        WrongAnswerBox().readSortedKey().reversed.toList();
    Map<String, dynamic> decodedMap = {};

    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.all(2),
      height: MediaQuery.of(context).size.height * 0.57,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Center(
            child: Container(
              child: Text('오답 목록'),
            ),
          ),
          if (sortedKey.isNotEmpty && sortedKey[0] != '')
            Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(4),
              height: MediaQuery.of(context).size.height * 0.53,
              child: Scrollbar(
                thickness: 5,
                controller: ListScrollController,
                child: ListView.builder(
                  controller: ListScrollController,
                  shrinkWrap: true,
                  itemCount: sortedKey.length,
                  itemBuilder: (context, index) {
                    decodedMap = jsonDecode(wrongAnswerMap[sortedKey[index]]!);
                    String area = decodedMap['area'];
                    String contents = decodedMap['contents'];
                    int wrongNumber = decodedMap['wrongNumber'];

                    return Column(
                      children: [
                        if (area != '')
                          Container(
                            key: GlobalKey(),
                            margin: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(border: Border.all()),
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text('영역 : ${area}'),
                                      Text('내용 : ${contents}'),
                                      Text('틀린 횟수 : ${wrongNumber}'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        WrongAnswerBox().deleteWrongAnswerMap(
                                            area, contents);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            )
        ],
      ),
    );
  }
}

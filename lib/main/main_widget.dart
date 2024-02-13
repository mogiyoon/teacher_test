import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.08;

    return Column(
      children: [
        if (TimeCalculator().dDay > 0)
          Column (
            children: [
              Text('시험까지', style: TextStyle(fontSize: size),),
              Text('${TimeCalculator().dDay} 일!', style: TextStyle(fontSize: size),),
            ],
          ),
        if (TimeCalculator().dDay  == 0)
          Text('D - Day', style: TextStyle(fontSize: size * 1.5),),
      ]
    );
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

//Todo : 오류찾기 구현
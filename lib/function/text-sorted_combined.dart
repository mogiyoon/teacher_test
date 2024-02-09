import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/text_widget.dart';
import 'package:teacher_test/test/test_screen.dart';


class TextSorterOneTwo extends StatelessWidget {
  TextStyle? textStyle;
  TextSorterOneTwo({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(subjectNum != 11)
          SizedText('1~2학년군'),
        if(subjectNum == 11)
          SizedText('바른 생활')
      ],
    );
  }
}

class TextSorterThreeFour extends StatelessWidget {
  TextStyle? textStyle;
  TextSorterThreeFour({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(subjectNum != 11)
          SizedText('3~4학년군'),
        if(subjectNum == 11)
          SizedText('슬기로운 생활')
      ],
    );
  }
}

class TextSorterFiveSix extends StatelessWidget {
  TextStyle? textStyle;
  TextSorterFiveSix({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(subjectNum != 11)
          SizedText('5~6학년군'),
        if(subjectNum == 11)
          SizedText('즐거운 생활')
      ],
    );
  }
}
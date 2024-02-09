import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/text_widget.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/table/table_text_builder.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';

class TableTestChoiceBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableListBuilder();
  }
}

class TableListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22Area = Table22().contentsTable22Area;

    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: Table22Area[subjectNum - 1].length,
        itemBuilder: (context, areaNum) {
          return Table(
              Table22Area[subjectNum - 1][areaNum], subjectNum, areaNum);
        });
  }
}

class Table extends StatelessWidget {
  String title;
  int subjectNum;
  int areaNum;

  Table(this.title, this.subjectNum, this.areaNum);

  double tableSpace = 60;

  @override
  Widget build(BuildContext context) {
    var testChoice = Provider.of<TestChoice>(context);
    bool isTest = testChoice.isTest;

    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (!isTest) ...[
              Center(
                  child: CopyWithBigText(
                title,
              )),
              TableTextCentralIdea(subjectNum, areaNum),
              TableTextCategory(),
              TableTextLowerCategoryListBuilder(areaNum),
              Container(
                height: tableSpace, // 표 사이 공간
              )
            ],
            if (isTest) ...[
              TableTestTitleForm(areaNum),
              TableTestCentralIdea(subjectNum, areaNum),
              TableTextCategory(),
              TableTestLowerCategoryListBuilder(areaNum),
              Container(
                height: tableSpace, // 표 사이 공간
              )
            ],
          ],
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/table/table_text_builder.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';

class TableTestChoiceBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: TableListBuilder());
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
        physics: const NeverScrollableScrollPhysics(),
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
                  child: Text(
                title,
                textScaleFactor: 1.2,
              )),
              TableTextCentralIdea(subjectNum, areaNum),
              TableCategory(),
              TableLowerCategoryListBuilder(areaNum),
              Container(
                height: tableSpace, // 표 사이 공간
              )
            ],
            if (isTest) ...[
              TableTitleForm(areaNum),
              TableTestCentralIdea(subjectNum, areaNum),
              TableCategory(),
              TableLowerCategoryListBuilder(areaNum),
              Container(
                height: tableSpace, // 표 사이 공간
              )
            ],
          ],
        ));
  }
}
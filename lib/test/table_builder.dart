import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/container_widget.dart';
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
          return Table(Table22Area[subjectNum - 1][areaNum], subjectNum, areaNum);
        });
  }
}

class Table extends StatelessWidget {
  String title;
  int subjectNum;
  int areaNum;

  Table(this.title, this.subjectNum, this.areaNum);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Center(child: Text(title)),
            CentralIdea(subjectNum, areaNum),
            Category(),
            Container(
              child: LowerCategoryListBuilder(areaNum),
            ),
            Container(
              height: 20,
            )
          ],
        ));
  }
}
class CentralIdea extends StatefulWidget {
  int areaNum;
  int subjectNum;
  CentralIdea(this.subjectNum, this.areaNum, {super.key});

  @override
  State<CentralIdea> createState() => CentralIdeaState();
}

class CentralIdeaState extends State<CentralIdea> {
  var Table22Area = Table22().contentsTable22Area;
  late int listLength = Table22Area[widget.subjectNum - 1].length;
  late List<GlobalKey> centralIdeaKeyList =
  List.generate(listLength, (i) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Container(
      key: centralIdeaKeyList[widget.areaNum],
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ContainerWithKey(
              widget.areaNum,
              child: Text('핵심 아이디어'),
            ),
          ),
          Expanded(flex: 3, child: TableCITextBuilder(widget.areaNum))
        ],
      ),
    );
  }
}

class TableCITextBuilder extends StatelessWidget {
  int areaNum;
  TableCITextBuilder(this.areaNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22CIIndex = Table22().contentsTable22CIIndex;
    List<String> inputList = Table22CIIndex[subjectNum - 1][areaNum];

    double constHeight = inputList.length.toDouble();
    if (constHeight <= 4) {
      constHeight = 4;
    }

    return Column(
      children: [
        if (inputList.length > 1)
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: inputList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: SelectableText(inputList[index]),
                        );
                      })))
      ],
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ContainerWithBorder(
              child: Text('범주'),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ContainerWithBorder(
                          child: Text('내용 요소'),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: ContainerWithBorder(
                                  child: Text('1~2학년군'),
                                )),
                            Expanded(
                              flex: 1,
                              child: ContainerWithBorder(child: Text('3~4학년군')),
                            ),
                            Expanded(
                                flex: 1,
                                child:
                                    ContainerWithBorder(child: Text('5~6학년군')))
                          ],
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class LowerCategoryListBuilder extends StatelessWidget {
  List<String> tableCategory = TableCategory22().tableCategory;
  int areaNum;

  LowerCategoryListBuilder(this.areaNum);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tableCategory.length,
        itemBuilder: (context, categoryNum) {
          return LowerCategory(
              tableCategory[categoryNum], areaNum, categoryNum);
        });
  }
}

class LowerCategory extends StatelessWidget {
  String title;
  int areaNum;
  int categoryNum;

  LowerCategory(this.title, this.areaNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var testChoice = Provider.of<TestChoice>(context);
    bool isTest = testChoice.isTest;

    var gradeChoice = Provider.of<GradeChoice>(context);
    bool isOneTwoCheck = gradeChoice.isOneTwoCheck;
    bool isThreeFourCheck = gradeChoice.isThreeFourCheck;
    bool isFiveSixCheck = gradeChoice.isFiveSixCheck;

    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22AreaIndex = Table22().contentsTable22AreaIndex;

    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ContainerWithBorder(
                        child: Text(title),
                      )),
                  if (Table22AreaIndex[subjectNum - 1][areaNum][categoryNum]
                          .length >
                      1)
                    Expanded(
                        flex: 3,
                        child:
                            TableLowerCategoryTextBuilder(areaNum, categoryNum)
//Todo 지식 이해 관련 LIST
                        )
                ],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
//Todo 학년군 체크시 사용할 IF문 추가
                  Expanded(
                      flex: 1,
                      child: ContainerWithBorder(
//Todo 지식 이해 관련 내용요소 LIST
                          )),
                  Expanded(
                      flex: 1,
                      child: ContainerWithBorder(
//Todo 지식 이해 관련 내용요소 LIST
                          )),
                  Expanded(
                      flex: 1,
                      child: ContainerWithBorder(
//Todo 지식 이해 관련 내용요소 LIST
                          )),
                ],
              ))
        ],
      ),
    );
  }
}

class TableLowerCategoryTextBuilder extends StatelessWidget {
  int areaNum;
  int categoryNum;

  TableLowerCategoryTextBuilder(this.areaNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22AreaIndex = Table22().contentsTable22AreaIndex;
    List<String> inputList =
        Table22AreaIndex[subjectNum - 1][areaNum][categoryNum];

    double constHeight = inputList.length.toDouble();
    if (constHeight <= 4) {
      constHeight = 4;
    }

    return Column(
      children: [
        if (inputList.length > 1)
          Container(
              child: Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: inputList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(border: Border.all()),
                          height: 21,
                          child: SelectableText(inputList[index]),
                        );
                      })))
      ],
    );
  }
}

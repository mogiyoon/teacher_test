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
                            TableLowerCategoryTextBuilder(areaNum, categoryNum))
                ],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
//Todo 학년군 체크시 사용할 IF문 추가
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        if (isOneTwoCheck)
                          TableValueTextBuilder(areaNum, 0, categoryNum),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        if (isThreeFourCheck)
                          TableValueTextBuilder(areaNum, 1, categoryNum),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          if (isFiveSixCheck)
                            TableValueTextBuilder(areaNum, 2, categoryNum),
                        ],
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
                          child: SelectableText(inputList[index]),
                        );
                      })))
      ],
    );
  }
}

class TableValueTextBuilder extends StatelessWidget {
  int areaNum;
  int gradeNum;
  int categoryNum;

  TableValueTextBuilder(this.areaNum, this.gradeNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22ValueIndex = Table22().contentsTable22ValueIndex;
    var Table22AreaIndex = Table22().contentsTable22AreaIndex;
    //TODO 아래부분 수정 필요 areaNum 변수 조정 필요

    List<List<String>> inputListValue =
        Table22ValueIndex[subjectNum - 1][gradeNum][areaNum];
    //koreanTableGradeValueIndex/koreanTableOneTwoValueIndex/koreanTableListenOneTwoValue
    List<String> inputListCategory =
        Table22AreaIndex[subjectNum - 1][areaNum][categoryNum];
    List<String> inputListCategoryKnowledge =
        Table22AreaIndex[subjectNum - 1][areaNum][0];
    List<String> inputListCategoryProcess =
        Table22AreaIndex[subjectNum - 1][areaNum][1];
    List<String> inputListCategoryWorth =
        Table22AreaIndex[subjectNum - 1][areaNum][2];
    //koreanTableAreaIndex/koreanTableListenCategoryIndex/koreanTableListenKnowledgeLowerCategory

    int categoryItemNum = 0;
    switch (categoryNum) {
      case 0:
        break;
      case 1:
        categoryItemNum = inputListCategoryKnowledge.length;
        break;
      case 2:
        categoryItemNum =
            inputListCategoryKnowledge.length + inputListCategoryProcess.length;
        break;
    }

    return Column(
      children: [
        Container(
            child: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inputListCategory.length,
                    itemBuilder: (context, index) {
                      categoryItemNum++;
                      return Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                inputListValue[categoryItemNum - 1].length,
                            itemBuilder: (context, i) {
                              return Container(
                                child: SelectableText(
                                    inputListValue[categoryItemNum - 1][i]),
                              );
                            }),
                      );
                    })))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/spatial_widget.dart';
import 'package:teacher_test/function/text_widget.dart';
import 'package:teacher_test/function/text-sorted_combined.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';


class TableTextCentralIdea extends StatefulWidget {
  int areaNum;
  int subjectNum;

  TableTextCentralIdea(this.subjectNum, this.areaNum, {super.key});

  @override
  State<TableTextCentralIdea> createState() => TableTextCentralIdeaState();
}

class TableTextCentralIdeaState extends State<TableTextCentralIdea> {
  var Table22Area = Table22().contentsTable22Area;
  late int listLength = Table22Area[widget.subjectNum - 1].length;
  late List<GlobalKey> centralIdeaTextKeyList =
  List.generate(listLength, (i) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Container(
      key: centralIdeaTextKeyList[widget.areaNum],
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TableTextContainerWithKey(
              widget.areaNum,
              child: SizedText('핵심 아이디어'),
            ),
          ),
          Expanded(flex: 3, child: TableTextCIBuilder(widget.areaNum))
        ],
      ),
    );
  }
}

class TableTextCIBuilder extends StatelessWidget {
  int areaNum;

  TableTextCIBuilder(this.areaNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22CIIndex = Table22().contentsTable22CIIndex;
    List<String> inputList = Table22CIIndex[subjectNum - 1][areaNum];

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
                          child: CopyWithText(inputList[index]),
                        );
                      })))
      ],
    );
  }
}

class TableTextCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ContainerWithBorder(
              child: SizedText('범주'),
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
                          child: SizedText('내용 요소'),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: ContainerWithBorder(
                                    child: TextSorterOneTwo())),
                            Expanded(
                                flex: 1,
                                child: ContainerWithBorder(
                                    child: TextSorterThreeFour())),
                            Expanded(
                                flex: 1,
                                child: ContainerWithBorder(
                                    child: TextSorterFiveSix()))
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

class TableTextLowerCategoryListBuilder extends StatelessWidget {
  List<String> tableCategory = TableCategory22().tableCategory;
  int areaNum;

  TableTextLowerCategoryListBuilder(this.areaNum);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tableCategory.length,
        itemBuilder: (context, categoryNum) {
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            child:
            TableTextLowerCategory(tableCategory[categoryNum], areaNum, categoryNum),
          );
        });
  }
}

class TableTextLowerCategory extends StatelessWidget {
  String category;
  int areaNum;
  int categoryNum;

  TableTextLowerCategory(this.category, this.areaNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var table22ValueIndex = Table22().contentsTable22ValueIndex;

    var gradeChoice = Provider.of<GradeChoice>(context);
    bool isOneTwoCheck = gradeChoice.isOneTwoCheck;
    bool isThreeFourCheck = gradeChoice.isThreeFourCheck;
    bool isFiveSixCheck = gradeChoice.isFiveSixCheck;

    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var Table22AreaIndex = Table22().contentsTable22AreaIndex;

    bool isValueOneToFourSame = false;
    bool isValueThreeToSixSame = false;
    Function eq = const ListEquality().equals;
    List<String> standardLowerCategory =
    Table22AreaIndex[subjectNum - 1][areaNum][categoryNum];
    List<String> standardLowerKnowledgeCategory =
    Table22AreaIndex[subjectNum - 1][areaNum][0];
    List<String> standardLowerProcessCategory =
    Table22AreaIndex[subjectNum - 1][areaNum][1];
    List<String> standardLowerWorthCategory =
    Table22AreaIndex[subjectNum - 1][areaNum][2];

    List<List<String>> gradeOneTwoValue =
    table22ValueIndex[subjectNum - 1][0][areaNum];
    List<List<String>> gradeThreeFourValue =
    table22ValueIndex[subjectNum - 1][1][areaNum];
    List<List<String>> gradeFiveSixValue =
    table22ValueIndex[subjectNum - 1][2][areaNum];

    if (standardLowerCategory.length <= 1 && standardLowerCategory[0] == '') {
      switch (categoryNum) {
        case (0):
          {
            isValueOneToFourSame =
                eq(gradeOneTwoValue[0], gradeThreeFourValue[0]);
            isValueThreeToSixSame =
                eq(gradeThreeFourValue[0], gradeFiveSixValue[0]);
          }
          break;
        case (1):
          {
            isValueOneToFourSame = eq(
                gradeOneTwoValue[standardLowerKnowledgeCategory.length],
                gradeThreeFourValue[standardLowerKnowledgeCategory.length]);
            isValueThreeToSixSame = eq(
                gradeThreeFourValue[standardLowerKnowledgeCategory.length],
                gradeFiveSixValue[standardLowerKnowledgeCategory.length]);
          }
          break;
        case (2):
          {
            isValueOneToFourSame = eq(
                gradeOneTwoValue[standardLowerKnowledgeCategory.length +
                    standardLowerProcessCategory.length],
                gradeThreeFourValue[standardLowerKnowledgeCategory.length +
                    standardLowerProcessCategory.length]);
            isValueThreeToSixSame = eq(
                gradeThreeFourValue[standardLowerKnowledgeCategory.length +
                    standardLowerProcessCategory.length],
                gradeFiveSixValue[standardLowerKnowledgeCategory.length +
                    standardLowerProcessCategory.length]);
          }
          break;
      }
    }

    return ContainerWithBorder(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: SizedText(category),
                      )),
                  if (standardLowerCategory.length > 1 ||
                      standardLowerCategory[0] != '')
                    Expanded(
                        flex: 3,
                        child:
                        TableTextLowerCategoryBuilder(areaNum, categoryNum))
                ],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  if (standardLowerCategory.length <= 1) ...[
                    if (!isValueOneToFourSame && !isValueThreeToSixSame) ...[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            if (isOneTwoCheck)
                              TableTextValueBuilder(areaNum, 0, categoryNum),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            if (isThreeFourCheck)
                              TableTextValueBuilder(areaNum, 1, categoryNum),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isFiveSixCheck)
                                TableTextValueBuilder(areaNum, 2, categoryNum),
                            ],
                          )),
                    ],
                    if (isValueOneToFourSame && !isValueThreeToSixSame) ...[
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              if (isOneTwoCheck || isThreeFourCheck)
                                TableTextValueBuilder(areaNum, 1, categoryNum)
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isFiveSixCheck)
                                TableTextValueBuilder(areaNum, 2, categoryNum),
                            ],
                          )),
                    ],
                    if (!isValueOneToFourSame && isValueThreeToSixSame) ...[
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isOneTwoCheck)
                                TableTextValueBuilder(areaNum, 0, categoryNum)
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              if (isThreeFourCheck || isFiveSixCheck)
                                TableTextValueBuilder(areaNum, 1, categoryNum),
                            ],
                          )),
                    ],
                    if (isValueOneToFourSame && isValueThreeToSixSame) ...[
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isOneTwoCheck ||
                                  isThreeFourCheck ||
                                  isFiveSixCheck)
                                TableTextValueBuilder(areaNum, 1, categoryNum)
                            ],
                          )),
                    ],
                  ],
                  if (standardLowerCategory.length > 1) ...[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          if (isOneTwoCheck)
                            TableTextValueBuilder(areaNum, 0, categoryNum),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          if (isThreeFourCheck)
                            TableTextValueBuilder(areaNum, 1, categoryNum),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            if (isFiveSixCheck)
                              TableTextValueBuilder(areaNum, 2, categoryNum),
                          ],
                        )),
                  ]
                ],
              ))
        ],
      ),
    );
  }
}

class TableTextLowerCategoryBuilder extends StatelessWidget {
  int areaNum;
  int categoryNum;

  TableTextLowerCategoryBuilder(this.areaNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var table22AreaIndex = Table22().contentsTable22AreaIndex;
    var table22ValueIndex = Table22().contentsTable22ValueIndex;
    var table22LowerCategoryIndex = Table22().contentsTable22LowerCategoryIndex;

    List<String> inputList =
    table22AreaIndex[subjectNum - 1][areaNum][categoryNum];
//ex)koreanTableAreaIndex/koreanTableListenCategoryIndex/koreanTableListenKnowledgeLowerCategory

    List<List<String>> inputListOneTwoValue =
    table22ValueIndex[subjectNum - 1][0][areaNum];
    List<List<String>> inputListThreeFourValue =
    table22ValueIndex[subjectNum - 1][1][areaNum];
    List<List<String>> inputListFiveSixValue =
    table22ValueIndex[subjectNum - 1][2][areaNum];
//ex)koreanTableGradeValueIndex/koreanTableOneTwoValueIndex/koreanTableListenOneTwoValue

    List<String> inputListLowerCategory =
    table22LowerCategoryIndex[subjectNum - 1][areaNum];

    int categoryIndexNum = 0;

    return Column(
      children: [
        Container(
            child: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inputList.length,
                    itemBuilder: (context, index) {
                      for (int i = 0; i < inputListLowerCategory.length; i++) {
                        if (inputList[index] == inputListLowerCategory[i]) {
                          categoryIndexNum = i;
                        }
                      }

                      int maxLength = 0;
                      if (maxLength <
                          inputListOneTwoValue[categoryIndexNum].length) {
                        maxLength =
                            inputListOneTwoValue[categoryIndexNum].length;
                      }
                      if (maxLength <
                          inputListThreeFourValue[categoryIndexNum].length) {
                        maxLength =
                            inputListThreeFourValue[categoryIndexNum].length;
                      }
                      if (maxLength <
                          inputListFiveSixValue[categoryIndexNum].length) {
                        maxLength =
                            inputListFiveSixValue[categoryIndexNum].length;
                      }

                      return Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: maxLength,
                              itemBuilder: (context, i) {
                                return Container(
                                  child: Column(
                                    children: [
                                      if (i < 1)
                                        CopyWithText(inputList[index]),
                                      if (i >= 1) SizedText(''),
                                    ],
                                  ),
                                );
                              }));
                    })))
      ],
    );
  }
}

class TableTextValueBuilder extends StatelessWidget {
  int areaNum;
  int gradeNum;
  int categoryNum;

  TableTextValueBuilder(this.areaNum, this.gradeNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var table22ValueIndex = Table22().contentsTable22ValueIndex;
    var table22AreaIndex = Table22().contentsTable22AreaIndex;

    List<List<String>> inputListValue =
    table22ValueIndex[subjectNum - 1][gradeNum][areaNum];
    List<List<String>> inputListOneTwoValue =
    table22ValueIndex[subjectNum - 1][0][areaNum];
    List<List<String>> inputListThreeFourValue =
    table22ValueIndex[subjectNum - 1][1][areaNum];
    List<List<String>> inputListFiveSixValue =
    table22ValueIndex[subjectNum - 1][2][areaNum];
    //ex)koreanTableGradeValueIndex/koreanTableOneTwoValueIndex/koreanTableListenOneTwoValue

    List<String> inputListCategory =
    table22AreaIndex[subjectNum - 1][areaNum][categoryNum];
    List<String> inputListCategoryKnowledge =
    table22AreaIndex[subjectNum - 1][areaNum][0];
    List<String> inputListCategoryProcess =
    table22AreaIndex[subjectNum - 1][areaNum][1];
    List<String> inputListCategoryWorth =
    table22AreaIndex[subjectNum - 1][areaNum][2];
    //ex)koreanTableAreaIndex/koreanTableListenCategoryIndex/koreanTableListenKnowledgeLowerCategory

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

                      int maxLength = 0;
                      if (maxLength <
                          inputListOneTwoValue[categoryItemNum - 1].length) {
                        maxLength =
                            inputListOneTwoValue[categoryItemNum - 1].length;
                      }
                      if (maxLength <
                          inputListThreeFourValue[categoryItemNum - 1].length) {
                        maxLength =
                            inputListThreeFourValue[categoryItemNum - 1].length;
                      }
                      if (maxLength <
                          inputListFiveSixValue[categoryItemNum - 1].length) {
                        maxLength =
                            inputListFiveSixValue[categoryItemNum - 1].length;
                      }

                      return Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: maxLength,
                            itemBuilder: (context, i) {
                              return Container(
                                child: Column(
                                  children: [
                                    if (i <
                                        inputListValue[categoryItemNum - 1]
                                            .length)
                                      CopyWithText(
                                          inputListValue[categoryItemNum - 1]
                                          [i]),
                                    if (i >=
                                        inputListValue[categoryItemNum - 1]
                                            .length)
                                      SizedText('')
                                  ],
                                ),
                              );
                            }),
                      );
                    })))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/answer_checker.dart';
import 'package:teacher_test/function/spatial_widget.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';

class TableTextEditing with ChangeNotifier {
  int subjectNum;
  TableTextEditing(this.subjectNum);

  late var tableTestTitleEditing = TableTestTitleEditing(subjectNum);
  late var tableTestCIEditing = TableTestCIEditing(subjectNum);
  late var tableTestLowerCategoryEditing = TableTestLowerCategoryEditing(subjectNum);
  late var tableTestValueEditing = TableTestValueEditing(subjectNum);
}

class TableTestTitleForm extends StatelessWidget {
  int areaNum;

  TableTestTitleForm(this.areaNum, {super.key});

  @override
  Widget build(BuildContext context) {
    var tableTextEditing = Provider.of<TableTextEditing>(context);
    var formList = tableTextEditing.tableTestTitleEditing;
    var tableTitleControllerList = formList.tableTitleControllerList;
    var tableTitleControllerAnswerCheckList = formList.tableTitleControllerAnswerCheckList;

    return Center(
      child: Container(
        width: 400,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 10,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
              ),
              controller: tableTitleControllerList[areaNum],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (tableTitleControllerAnswerCheckList[areaNum] == 0)
                    ColorContainer(Colors.white),
                  if (tableTitleControllerAnswerCheckList[areaNum] == 1)
                    ColorContainer(Colors.green.shade200),
                  if (tableTitleControllerAnswerCheckList[areaNum] == 2)
                    ColorContainer(Colors.red.shade200)
                ],
              ))
        ]),
      ),
    );
  }
}

class TableTestTitleEditing {
  int subjectNum;

  TableTestTitleEditing(this.subjectNum);

  var table22AreaIndex = Table22().contentsTable22AreaIndex;

  late List<TextEditingController> tableTitleControllerList = List.generate(
      table22AreaIndex[subjectNum - 1].length, (i) => TextEditingController());
  late List<int> tableTitleControllerAnswerCheckList =
      List.generate(table22AreaIndex[subjectNum - 1].length, (i) => 0);
}

class TableTestCentralIdea extends StatefulWidget {
  int areaNum;
  int subjectNum;

  TableTestCentralIdea(this.subjectNum, this.areaNum, {super.key});

  @override
  State<TableTestCentralIdea> createState() => TableTestCentralIdeaState();
}

class TableTestCentralIdeaState extends State<TableTestCentralIdea> {
  var table22Area = Table22().contentsTable22Area;
  late int listLength = table22Area[widget.subjectNum - 1].length;
  late List<GlobalKey> centralIdeaTestKeyList =
      List.generate(listLength, (i) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Container(
      key: centralIdeaTestKeyList[widget.areaNum],
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TableTestContainerWithKey(
              widget.areaNum,
              child: Text('핵심 아이디어'),
            ),
          ),
          Expanded(flex: 3, child: TableTestCIFormBuilder(widget.areaNum))
        ],
      ),
    );
  }
}

class TableTestCIFormBuilder extends StatelessWidget {
  int areaNum;

  TableTestCIFormBuilder(this.areaNum, {super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;

    var tableTextEditing = Provider.of<TableTextEditing>(context);
    var formList = tableTextEditing.tableTestCIEditing;
    var tableCIControllerListArea = formList.tableCIControllerListArea;
    var tableCIControllerAnswerCheckListArea =
        formList.tableCIControllerAnswerCheckListArea;

    var Table22CIIndex = Table22().contentsTable22CIIndex;
    List<String> inputList = Table22CIIndex[subjectNum - 1][areaNum];

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: inputList.length,
        itemBuilder: (context, index) {
          return Row(children: [
            Expanded(
              flex: 10,
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                ),
                controller: tableCIControllerListArea[areaNum][index],
                style: TextStyle(fontSize: 13),
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (tableCIControllerAnswerCheckListArea[areaNum][index] ==
                        0)
                      ColorContainer(Colors.white),
                    if (tableCIControllerAnswerCheckListArea[areaNum][index] ==
                        1)
                      ColorContainer(Colors.green.shade200),
                    if (tableCIControllerAnswerCheckListArea[areaNum][index] ==
                        2)
                      ColorContainer(Colors.red.shade200)
                  ],
                ))
          ]);
        });
  }
}

class TableTestCIEditing {
  int subjectNum;

  TableTestCIEditing(this.subjectNum);

  var table22CIIndex = Table22().contentsTable22CIIndex;

  late List<List<TextEditingController>> tableCIControllerListArea =
      List.generate(table22CIIndex[subjectNum - 1].length, (areaNum) {
    return (List.generate(table22CIIndex[subjectNum - 1][areaNum].length,
        (index) => TextEditingController()));
  });

  late List<List<int>> tableCIControllerAnswerCheckListArea =
      List.generate(table22CIIndex[subjectNum - 1].length, (areaNum) {
    return (List.generate(
        table22CIIndex[subjectNum - 1][areaNum].length, (index) => 0));
  });
}

class TableTestLowerCategoryListBuilder extends StatelessWidget {
  List<String> tableCategory = TableCategory22().tableCategory;
  int areaNum;

  TableTestLowerCategoryListBuilder(this.areaNum);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tableCategory.length,
        itemBuilder: (context, categoryNum) {
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TableTestLowerCategory(
                tableCategory[categoryNum], areaNum, categoryNum),
          );
        });
  }
}

class TableTestLowerCategory extends StatelessWidget {
  String title;
  int areaNum;
  int categoryNum;

  TableTestLowerCategory(this.title, this.areaNum, this.categoryNum);

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
                        child: Text(title),
                      )),
                  if (standardLowerCategory.length > 1 ||
                      standardLowerCategory[0] != '')
                    Expanded(
                        flex: 3,
                        child:
                            TableTestLowerCategoryBuilder(areaNum, categoryNum))
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
                              TableTestValueBuilder(areaNum, 0, categoryNum),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            if (isThreeFourCheck)
                              TableTestValueBuilder(areaNum, 1, categoryNum),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isFiveSixCheck)
                                TableTestValueBuilder(areaNum, 2, categoryNum),
                            ],
                          )),
                    ],
                    if (isValueOneToFourSame && !isValueThreeToSixSame) ...[
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              if (isOneTwoCheck || isThreeFourCheck)
                                TableTestValueBuilder(areaNum, 1, categoryNum)
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isFiveSixCheck)
                                TableTestValueBuilder(areaNum, 2, categoryNum),
                            ],
                          )),
                    ],
                    if (!isValueOneToFourSame && isValueThreeToSixSame) ...[
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              if (isOneTwoCheck)
                                TableTestValueBuilder(areaNum, 0, categoryNum)
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              if (isThreeFourCheck || isFiveSixCheck)
                                TableTestValueBuilder(areaNum, 1, categoryNum),
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
                                TableTestValueBuilder(areaNum, 1, categoryNum)
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
                            TableTestValueBuilder(areaNum, 0, categoryNum),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          if (isThreeFourCheck)
                            TableTestValueBuilder(areaNum, 1, categoryNum),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            if (isFiveSixCheck)
                              TableTestValueBuilder(areaNum, 2, categoryNum),
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

class TableTestLowerCategoryBuilder extends StatelessWidget {
  int areaNum;
  int categoryNum;

  TableTestLowerCategoryBuilder(this.areaNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var table22AreaIndex = Table22().contentsTable22AreaIndex;
    var table22ValueIndex = Table22().contentsTable22ValueIndex;
    var table22LowerCategoryIndex = Table22().contentsTable22LowerCategoryIndex;

    var tableTextEditing = Provider.of<TableTextEditing>(context);
    var formList = tableTextEditing.tableTestLowerCategoryEditing;
    var tableLowerCategoryControllerListArea = formList.tableLowerCategoryControllerListArea;
    var tableLowerCategoryControllerAnswerCheckListArea =
        formList.tableLowerCategoryControllerAnswerCheckListArea;

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
  //Sum of LowerCategory of Area

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
                      //Know current categoryNum in Sum of category

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
                                        Row(children: [
                                          Expanded(
                                            flex: 9,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                isDense: true,
                                              ),
                                              controller:
                                                  tableLowerCategoryControllerListArea[
                                                      areaNum][categoryNum][index],
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (tableLowerCategoryControllerAnswerCheckListArea[
                                                                  areaNum]
                                                              [categoryNum]
                                                          [index] ==
                                                      0)
                                                    ColorContainer(
                                                        Colors.white),
                                                  if (tableLowerCategoryControllerAnswerCheckListArea[
                                                                  areaNum]
                                                              [categoryNum]
                                                          [index] ==
                                                      1)
                                                    ColorContainer(
                                                        Colors.green.shade200),
                                                  if (tableLowerCategoryControllerAnswerCheckListArea[
                                                                  areaNum]
                                                              [categoryNum]
                                                          [index] ==
                                                      2)
                                                    ColorContainer(
                                                        Colors.red.shade200)
                                                ],
                                              ))
                                        ]),
                                      if (i >= 1)
                                        Row(children: [
                                          Expanded(
                                            flex: 9,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                isDense: true,
                                              ),
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ColorContainer(Colors.white),
                                                ],
                                              ))
                                        ]),
                                    ],
                                  ),
                                );
                              }));
                    })))
      ],
    );
  }
}

class TableTestLowerCategoryEditing {
  int subjectNum;

  TableTestLowerCategoryEditing(this.subjectNum);

  var contentsTable22AreaIndex = Table22().contentsTable22AreaIndex;

  late List<List<List<TextEditingController>>>
      tableLowerCategoryControllerListArea =
      List.generate(contentsTable22AreaIndex[subjectNum - 1].length, (areaNum) {
    return (List.generate(
        contentsTable22AreaIndex[subjectNum - 1][areaNum].length,
        (categoryNum) {
      return (List.generate(
          contentsTable22AreaIndex[subjectNum - 1][areaNum][categoryNum].length,
          (index) => TextEditingController()));
    }));
  });

  late List<List<List<int>>> tableLowerCategoryControllerAnswerCheckListArea =
      List.generate(contentsTable22AreaIndex[subjectNum - 1].length, (areaNum) {
    return (List.generate(
        contentsTable22AreaIndex[subjectNum - 1][areaNum].length,
        (categoryNum) {
      return (List.generate(
          contentsTable22AreaIndex[subjectNum - 1][areaNum][categoryNum].length,
          (index) => 0));
    }));
  });
}

class TableTestValueBuilder extends StatelessWidget {
  int areaNum;
  int gradeNum;
  int categoryNum;

  TableTestValueBuilder(this.areaNum, this.gradeNum, this.categoryNum);

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var table22ValueIndex = Table22().contentsTable22ValueIndex;
    var table22AreaIndex = Table22().contentsTable22AreaIndex;

    var tableTextEditing = Provider.of<TableTextEditing>(context);
    var formList = tableTextEditing.tableTestValueEditing;
    var tableValueControllerListArea = formList.tableValueControllerListArea;
    var tableValueControllerAnswerCheckListArea =
        formList.tableValueControllerAnswerCheckListArea;

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
                                      Row(children: [
                                        Expanded(
                                          flex: 10,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                            ),
                                            controller:
                                                tableValueControllerListArea[
                                                        gradeNum][areaNum]
                                                    [categoryItemNum - 1][i],
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (tableValueControllerAnswerCheckListArea[
                                                            gradeNum][areaNum][
                                                        categoryItemNum -
                                                            1][i] ==
                                                    0)
                                                  ColorContainer(Colors.white),
                                                if (tableValueControllerAnswerCheckListArea[
                                                            gradeNum][areaNum][
                                                        categoryItemNum -
                                                            1][i] ==
                                                    1)
                                                  ColorContainer(
                                                      Colors.green.shade200),
                                                if (tableValueControllerAnswerCheckListArea[
                                                            gradeNum][areaNum][
                                                        categoryItemNum -
                                                            1][i] ==
                                                    2)
                                                  ColorContainer(
                                                      Colors.red.shade200)
                                              ],
                                            ))
                                      ]),
                                    if (i >=
                                        inputListValue[categoryItemNum - 1]
                                            .length)
                                      Row(children: [
                                        Expanded(
                                          flex: 10,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                            ),
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                ColorContainer(Colors.white),
                                              ],
                                            ))
                                      ]),
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

class TableTestValueEditing {
  int subjectNum;

  TableTestValueEditing(this.subjectNum);

  var contentsTable22ValueIndex = Table22().contentsTable22ValueIndex;

  late List<List<List<List<TextEditingController>>>>
      tableValueControllerListArea = List.generate(3, (gradeNum) {
    return (List.generate(
        contentsTable22ValueIndex[subjectNum - 1][gradeNum].length, (areaNum) {
      return (List.generate(
          contentsTable22ValueIndex[subjectNum - 1][gradeNum][areaNum].length,
          (categoryItemNum) {
        return (List.generate(
            contentsTable22ValueIndex[subjectNum - 1][gradeNum][areaNum]
                    [categoryItemNum]
                .length,
            (index) => TextEditingController()));
      }));
    }));
  });

  late List<List<List<List<int>>>> tableValueControllerAnswerCheckListArea =
      List.generate(3, (gradeNum) {
    return (List.generate(
        contentsTable22ValueIndex[subjectNum - 1][gradeNum].length, (areaNum) {
      return (List.generate(
          contentsTable22ValueIndex[subjectNum - 1][gradeNum][areaNum].length,
          (categoryItemNum) {
        return (List.generate(
            contentsTable22ValueIndex[subjectNum - 1][gradeNum][areaNum]
                    [categoryItemNum]
                .length,
            (index) => 0));
      }));
    }));
  });
}

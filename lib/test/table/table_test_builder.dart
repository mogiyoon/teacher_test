import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/function/about_answer.dart';
import 'package:teacher_test/function/container_widget.dart';
import 'package:teacher_test/function/text-sorted_combined.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';

class TableTitleForm extends StatelessWidget {
  int areaNum;

  TableTitleForm(this.areaNum, {super.key});

  @override
  Widget build(BuildContext context) {
    var formList = Provider.of<TableTitleEditing>(context);
    var tableTitleControllerList = formList.tableTitleControllerList;

    return Row(children: [
      Expanded(
        flex: 10,
        child: TextFormField(
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
              if (formList.tableTitleControllerAnswerCheckList[areaNum] == 0)
                ColorContainer(Colors.white),
              if (formList.tableTitleControllerAnswerCheckList[areaNum] == 1)
                ColorContainer(Colors.green.shade200),
              if (formList.tableTitleControllerAnswerCheckList[areaNum] == 2)
                ColorContainer(Colors.red.shade200)
            ],
          ))
    ]);
  }
}

class TableTitleEditing with ChangeNotifier {
  int listLength;

  TableTitleEditing(this.listLength);

  late List<TextEditingController> tableTitleControllerList =
      List.generate(listLength, (i) => TextEditingController());
  late List<int> tableTitleControllerAnswerCheckList =
      List.generate(listLength, (i) => 0);
}

class TableTestCentralIdea extends StatefulWidget {
  int areaNum;
  int subjectNum;

  TableTestCentralIdea(this.subjectNum, this.areaNum, {super.key});

  @override
  State<TableTestCentralIdea> createState() => TableTestCentralIdeaState();
}

class TableTestCentralIdeaState extends State<TableTestCentralIdea> {
  var Table22Area = Table22().contentsTable22Area;
  late int listLength = Table22Area[widget.subjectNum - 1].length;
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
            child: ContainerWithKey(
              widget.areaNum,
              child: Text('핵심 아이디어'),
            ),
          ),
          Expanded(flex: 3, child: TableCIFormBuilder(widget.areaNum))
        ],
      ),
    );
  }
}

class TableCIFormBuilder extends StatelessWidget {
  int areaNum;
  TableCIFormBuilder(this.areaNum, {super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    int subjectNum = routeContents.subjectNum;
    var formList = Provider.of<TableCIEditing>(context);

    var tableCIControllerListArea = formList.tableCIControllerListArea;
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
                controller: tableCIControllerListArea[areaNum][index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (formList.tableCIControllerAnswerCheckListArea[areaNum][index] == 0)
                      ColorContainer(Colors.white),
                    if (formList.tableCIControllerAnswerCheckListArea[areaNum][index] == 1)
                      ColorContainer(Colors.green.shade200),
                    if (formList.tableCIControllerAnswerCheckListArea[areaNum][index] == 2)
                      ColorContainer(Colors.red.shade200)
                  ],
                ))
          ]);
        });
  }
}

class TableCIEditing with ChangeNotifier {
  int subjectNumLength;
  int CILength;

  TableCIEditing(this.subjectNumLength, this.CILength);

  late List<TextEditingController> tableCIControllerList =
      List.generate(CILength, (i) => TextEditingController());
  late List<List<TextEditingController>> tableCIControllerListArea =
      List.generate(subjectNumLength, (i) => tableCIControllerList);

  late List<int> tableCIControllerAnswerCheckList =
      List.generate(CILength, (i) => 0);
  late List<List<int>> tableCIControllerAnswerCheckListArea =
  List.generate(subjectNumLength, (i) => tableCIControllerAnswerCheckList);
}

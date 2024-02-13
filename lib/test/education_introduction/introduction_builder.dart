import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/contents/introduction_contents.dart';
import 'package:teacher_test/function/spatial_widget.dart';
import 'package:teacher_test/function/text_widget.dart';
import 'package:teacher_test/test/test_contents.dart';

class EducationIntroductionTestChoiceBuilder extends StatelessWidget {
  const EducationIntroductionTestChoiceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var testChoice = Provider.of<TestChoice>(context);
    bool isTest = testChoice.isTest;

    var educationIntroduction = EducationIntroduction();
    late List<String> educationIntroductionList =
        educationIntroduction.educationIntroductionList;

    return Column(
      children: [
        if (isTest) EducationIntroductionFormBuilder(educationIntroductionList),
        if (!isTest) EducationIntroductionTextBuilder(educationIntroductionList)
      ],
    );
  }
}

class EducationIntroductionTextBuilder extends StatelessWidget {
  List<String> educationIntroductionList;

  EducationIntroductionTextBuilder(this.educationIntroductionList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.all(30),
        itemCount: educationIntroductionList.length,
        itemBuilder: (context, index) {
          return Container(
              height: 50,
              child: CopyWithText(educationIntroductionList[index]));
        });
    ;
  }
}

class EducationIntroductionFormBuilder extends StatelessWidget {
  List<String> educationIntroductionList;
  EducationIntroductionFormBuilder(this.educationIntroductionList, {super.key});

  @override
  Widget build(BuildContext context) {
    var formList = Provider.of<EducationIntroductionTextEditing>(context);
    var educationIntroductionControllerList = formList.educationIntroductionControllerList;


    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30),
          itemCount: educationIntroductionList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        controller: educationIntroductionControllerList[index],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (formList
                              .educationIntroductionCheckList[index] == 0)
                            ColorContainer(Colors.white),
                          if (formList
                              .educationIntroductionCheckList[index] == 1)
                            ColorContainer(Colors.green.shade200),
                          if (formList
                              .educationIntroductionCheckList[index] == 2)
                            ColorContainer(Colors.red.shade200)
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                    )
                  ],
                ),
              ],
            );
          }),
    );;
  }
}

class EducationIntroductionTextEditing with ChangeNotifier {
  var educationIntroduction = EducationIntroduction();
  late List<String> educationIntroductionList =
      educationIntroduction.educationIntroductionList;

  late List<TextEditingController> educationIntroductionControllerList = List.generate(
      educationIntroductionList.length, (i) => TextEditingController());
  late List<int> educationIntroductionCheckList = List.generate(
      educationIntroductionList.length, (i) => 0);
}
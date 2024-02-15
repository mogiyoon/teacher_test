import 'package:teacher_test/contents/introduction_contents.dart';
import 'package:teacher_test/function/answer_check/answer_checker.dart';
import 'package:teacher_test/test/education_introduction/introduction_builder.dart';

class EducationIntroductionCheckAnswer {
  EducationIntroductionTextEditing newTextEditor;
  bool isIncludeSpace;

  EducationIntroductionCheckAnswer(this.newTextEditor, this.isIncludeSpace);

  var educationIntroduction = EducationIntroduction();
  late List<String> inputList = educationIntroduction.educationIntroductionList;

  void educationIntroductionCheckAnswer() {
    for (int i = 0; i < inputList.length; i++) {
      String removeSpaceText = Remove(isIncludeSpace)
          .space(newTextEditor.educationIntroductionControllerList[i].text);
      List<String> removeSpaceList =
      Remove(isIncludeSpace).spaceList(inputList);

      if (removeSpaceText == removeSpaceList[i]) {
        newTextEditor.educationIntroductionCheckList[i] = 1;
      } else if (newTextEditor.educationIntroductionControllerList[i].text ==
          '') {
        newTextEditor.educationIntroductionCheckList[i] = 0;
      } else {
        EducationIntroductionWrongAnswerToDB().educationIntroductionWrongWriter(inputList[i]);
        newTextEditor.educationIntroductionCheckList[i] = 2;
      }
    }
  }
}

class EducationIntroductionDeleteAnswer {
  EducationIntroductionTextEditing newTextEditor;

  EducationIntroductionDeleteAnswer(this.newTextEditor);

  void educationIntroductionDeleteAnswer() {
    for (int i = 0;
    i < newTextEditor.educationIntroductionControllerList.length;
    i++) {
      newTextEditor.educationIntroductionControllerList[i].text = '';
      newTextEditor.educationIntroductionCheckList[i] = 0;
    }
    newTextEditor.notifyListeners();
  }
}
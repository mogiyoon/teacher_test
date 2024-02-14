import 'package:flutter/material.dart';
import 'package:teacher_test/main.dart';
import 'package:teacher_test/setting/setting_screen.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/education_introduction/introduction_builder.dart';
import 'package:teacher_test/test/education_introduction/test_introduction_screen.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';

class ScreenRouter {
  Map<String, WidgetBuilder> routeIndex() {
    Map<String, WidgetBuilder> routeMap = {
      '/Main': (context) => MyHomePage(),
      '/TestScreen': (context) => TestScreen(),
      '/SettingScreen': (context) => SettingScreen(),
      '/EducationIntroductionScreen': (context) =>
          EducationIntroductionScreen(),
    };
    return routeMap;
  }
}

//TODO Education 버젼도 추가
class TextEditRouter {
  Map<String, AchieveTextEditing> achieveTextEdit = {};
  Map<String, TableTextEditing> tableTextEdit = {};
  Map<String, EducationIntroductionTextEditing> educationIntroductionTextEdit =
      {};

  AchieveTextEditing returnAchieveTextEditing(int subjectNum) {
    if (achieveTextEdit['$subjectNum'] != null) {
      return achieveTextEdit['$subjectNum']!;
    }
    return AchieveTextEditing(subjectNum);
  }

  TableTextEditing returnTableTextEditing(int subjectNum) {
    if (tableTextEdit['$subjectNum'] != null) {
      return tableTextEdit['$subjectNum']!;
    }
    return TableTextEditing(subjectNum);
  }

  EducationIntroductionTextEditing returnEducationIntroductionTextEditing() {
    if (educationIntroductionTextEdit['1'] != null) {
      return educationIntroductionTextEdit['1']!;
    }
    return EducationIntroductionTextEditing();
  }

  void writeAchieveTextEditing(
      int subjectNum, AchieveTextEditing newAchieveTextEditor) {
    achieveTextEdit['$subjectNum'] = newAchieveTextEditor;
  }

  void writeTableTextEditing(
      int subjectNum, TableTextEditing newTableTextEditor) {
    tableTextEdit['$subjectNum'] = newTableTextEditor;
  }

  void writeEducationIntroductionTextEditing(
      EducationIntroductionTextEditing newEducationIntroductionTextEditor) {
    educationIntroductionTextEdit['1'] = newEducationIntroductionTextEditor;
  }
}

class TestChoiceRouter {
  int subjectNum = -1;
  bool isTableTest = false;
  bool isAchieveTest = false;
  bool wasEducationTest = false;
  var gradeChoice = GradeChoice();
  var testChoice = TestChoice();

  bool isGradeReady = false;
  bool isTestReady = false;

  GradeChoice returnGradeChoice(
      int inputSubjectNum, bool inputIsTableTest, bool inputIsAchieveTest) {
    if (subjectNum == inputSubjectNum) {
      if (isTableTest == inputIsTableTest &&
          isAchieveTest == inputIsAchieveTest &&
          isTableTest != isAchieveTest) {
        return gradeChoice;
      }
    }
    gradeChoice = GradeChoice();
    isGradeReady = true;
    valueReset(inputSubjectNum, inputIsTableTest, inputIsAchieveTest);
    return gradeChoice;
  }

  TestChoice returnTestChoice(
      int inputSubjectNum, bool inputIsTableTest, bool inputIsAchieveTest) {
    if (wasEducationTest == false) {
      if (subjectNum == inputSubjectNum) {
        if (isTableTest == inputIsTableTest &&
            isAchieveTest == inputIsAchieveTest &&
            isTableTest != isAchieveTest) {
          return testChoice;
        }
      }
    }
    wasEducationTest = false;
    testChoice = TestChoice();
    isTestReady = true;
    valueReset(inputSubjectNum, inputIsTableTest, inputIsAchieveTest);
    return testChoice;
  }

  TestChoice returnEducationTestChoice() {
    if (wasEducationTest) {
      return testChoice;
    }
    wasEducationTest = true;
    testChoice = TestChoice();
    return testChoice;
  }

  void valueReset(
      int inputSubjectNum, bool inputIsTableTest, bool inputIsAchieveTest) {
    if (isGradeReady == true && isTestReady == true) {
      subjectNum = inputSubjectNum;
      isTableTest = inputIsTableTest;
      isAchieveTest = inputIsAchieveTest;
      isGradeReady = false;
      isTestReady = false;
    }
  }

}

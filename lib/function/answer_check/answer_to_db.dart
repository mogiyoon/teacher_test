import 'package:teacher_test/contents/contents.dart';
import 'package:teacher_test/db/wrong_answer_list_db.dart';
import 'package:teacher_test/function/text-sorted_combined.dart';
import 'package:teacher_test/function/widget/screen_widget.dart';

class toDB {
  void wrongWriter(String area, String contents) {
    String jsonWrongAnswer =
        WrongAnswerMap().encodeWrongAnswerToJson(area, contents);
    Map<String, dynamic> wrongAnswerUnsortedMap =
        WrongAnswerMap().toWrongAnswerMap(jsonWrongAnswer);
    WrongAnswerBox().writeWrongAnswerMap(wrongAnswerUnsortedMap);
  }
}

class AchieveWrongAnswerToDB {
  List<String> subject = TestSetting().subject;

  void achieveWriter(int subjectNum, int grade, String contents) {
    String gradeName = TextSorter().sortingName(subjectNum, grade);
    String area = '성취기준-${subject[subjectNum - 1]}-$gradeName';
    toDB().wrongWriter(area, contents);
  }
}

class TableWrongAnswerToDB {
  List<String> subject = TestSetting().subject;
  var table22 = Table22();
  var table22Area = Table22().contentsTable22Area;
  var tableCategory22 = TableCategory22();
  var tableLowerCategoryIndex22 = Table22().contentsTable22LowerCategoryIndex;

  void titleWriter(int subjectNum, String contents) {
    String area = '내용체계표-${subject[subjectNum - 1]}-영역';
    toDB().wrongWriter(area, contents);
  }

  void CIWriter(int subjectNum, int areaNum) {
    String area =
        '내용체계표-${subject[subjectNum - 1]}-${table22Area[subjectNum - 1][areaNum]}';
    toDB().wrongWriter(area, '핵심 아이디어');
  }

  void lowerCategoryWriter(
      int subjectNum, int areaNum, int categoryNum, String contents) {
    String area =
        '내용체계표-${subject[subjectNum - 1]}-${table22Area[subjectNum - 1][areaNum]}-${tableCategory22.tableCategory[categoryNum]}';
    toDB().wrongWriter(area, contents);
  }

  void valueWrite(int subjectNum, int grade, int areaNum,
      int categoryItemNum) {
    String gradeName = TextSorter().sortingName(subjectNum, grade);
    String area =
        '내용체계표-${subject[subjectNum - 1]}-${table22Area[subjectNum - 1][areaNum]}-$gradeName-${tableLowerCategoryIndex22[subjectNum - 1][areaNum][categoryItemNum]}';
    toDB().wrongWriter(area, '내용 요소');
  }
}

class EducationIntroductionWrongAnswerToDB {
  List<String> subject = TestSetting().subject;

  void educationWriter(String contents, int index) {
    String area = '총론-${index}번';
    toDB().wrongWriter(area, contents);
  }
}

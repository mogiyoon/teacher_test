export 'art_contents.dart';
export 'combined_subject_contents.dart';
export 'english_contents.dart';
export 'ethics_contents.dart';
export 'korean_contents.dart';
export 'math_contents.dart';
export 'music_contents.dart';
export 'pe_contents.dart';
export 'practical_contents.dart';
export 'science_contents.dart';
export 'society_contents.dart';
import '';

class Achieve22 {
  //  ['국어', '수학', '사회', '과학', '영어', '체육', '미술', '음악', '도덕', '실과', '통합']
  var koreanAchieve22 = KoreanAchieve22();
  var mathAchieve22 = MathAchieve22();
  var societyAchieve22 = SocietyAchieve22();
  var scienceAchieve22 = ScienceAchieve22();
  var englishAchieve22 = EnglishAchieve22();
  var peAchieve22 = PEAchieve22();
  var artAchieve22 = ArtAchieve22();
  var musicAchieve22 = MusicAchieve22();
  var ethicsAchieve22 = EthicsAchieve22();
  var practicalAchieve22 = PracticalAchieve22();
  var combinedSubjectAchieve22 = CombinedSubjectAchieve22();

  late List<List<List<String>>> contentsAchieve22Index = [
    koreanAchieve22.koreanAchieveIndex,
    mathAchieve22.mathAchieveIndex,
    societyAchieve22.societyAchieveIndex,
    scienceAchieve22.scienceAchieveIndex,
    englishAchieve22.englishAchieveIndex,
    peAchieve22.peAchieveIndex,
    artAchieve22.artAchieveIndex,
    musicAchieve22.musicAchieveIndex,
    ethicsAchieve22.ethicsAchieveIndex,
    practicalAchieve22.practicalAchieveIndex,
    combinedSubjectAchieve22.combinedSubjectAchieveIndex
  ];

  late List<List<String>> contentsAchieve22 = [
    koreanAchieve22.koreanAchieve,
    mathAchieve22.mathAchieve,
    societyAchieve22.societyAchieve,
    scienceAchieve22.scienceAchieve,
    englishAchieve22.englishAchieve,
    peAchieve22.peAchieve,
    artAchieve22.artAchieve,
    musicAchieve22.musicAchieve,
    ethicsAchieve22.ethicsAchieve,
    practicalAchieve22.practicalAchieve,
    combinedSubjectAchieve22.combinedSubjectAchieve
  ];
}

class TableReturn22 {
  String title;
  String grade;
  String category;
  String lowerCategory;
  List<String> contentsList;
  TableReturn22 (this.title, this.grade, this.category, this.lowerCategory, this.contentsList);

  String returnTitle() {
    return title;
  }
  String returnGrade() {
    return grade;
  }
  String returnCategory() {
    return category;
  }
  String returnLowerCategory() {
    return lowerCategory;
  }
  List<String> returnContents() {
    return contentsList;
  }
}
class TableCategory22 {
  List<String> tableGrade = ['1~2학년', '3~4학년', '5~6학년'];
  List<String> tableCategory = ['지식·이해', '과정·기능', '가치·태도'];
}
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

class Table22 {
  var koreanTable22 = KoreanTable22();
  var mathTable22 = MathTable22();
  var societyTable22 = SocietyTable22();
  var scienceTable22 = ScienceTable22();
  var englishTable22 = EnglishTable22();
  var peTable22 = PETable22();
  var artTable22 = ArtTable22();
  // var musicTable22 = MusicTable22();
  // var ethicsTable22 = EthicsTable22();
  // var practicalTable22 = PracticalTable22();
  // var combinedSubjectTable22 = CombinedSubjectTable22();

  late List<List<String>> contentsTable22Area = [
    koreanTable22.koreanTableArea,
    mathTable22.mathTableArea,
    societyTable22.societyTableArea,
    scienceTable22.scienceTableArea,
    englishTable22.englishTableArea,
    peTable22.peTableArea,
    artTable22.artTableArea,
    // musicTable22.musicTableArea,
    // ethicsTable22.ethicsTableArea,
    // practicalTable22.practicalTableArea,
    // combinedSubjectTable22.combinedSubjectTableArea,
  ];

  late List<List<List<List<String>>>> contentsTable22AreaIndex = [
    koreanTable22.koreanTableAreaIndex,
    mathTable22.mathTableAreaIndex,
    societyTable22.societyTableAreaIndex,
    scienceTable22.scienceTableAreaIndex,
    englishTable22.englishTableAreaIndex,
    peTable22.peTableAreaIndex,
    artTable22.artTableAreaIndex,
    // musicTable22.musicTableAreaIndex,
    // ethicsTable22.ethicsTableAreaIndex,
    // practicalTable22.practicalTableAreaIndex,
    // combinedSubjectTable22.combinedSubjectTableAreaIndex,
  ];
  
  late List<List<List<String>>> contentsTable22CIIndex = [
    koreanTable22.koreanTableCIIndex,
    mathTable22.mathTableCIIndex,
    societyTable22.societyTableCIIndex,
    scienceTable22.scienceTableCIIndex,
    englishTable22.englishTableCIIndex,
    peTable22.peTableCIIndex,
    artTable22.artTableCIIndex,
    // musicTable22.musicTableCIIndex,
    // ethicsTable22.ethicsTableCIIndex,
    // practicalTable22.practicalTableCIIndex,
    // combinedSubjectTable22.combinedSubjectTableCIIndex,
  ];

  late List<List<List<String>>> contentsTable22LowerCategoryIndex = [
    koreanTable22.koreanTableLowerCategoryIndex,
    mathTable22.mathTableLowerCategoryIndex,
    societyTable22.societyTableLowerCategoryIndex,
    scienceTable22.scienceTableLowerCategoryIndex,
    englishTable22.englishTableLowerCategoryIndex,
    peTable22.peTableLowerCategoryIndex,
    artTable22.artTableLowerCategoryIndex,
    // musicTable22.musicTableLowerCategoryIndex,
    // ethicsTable22.ethicsTableLowerCategoryIndex,
    // practicalTable22.practicalTableLowerCategoryIndex,
    // combinedSubjectTable22.combinedSubjectTableLowerCategoryIndex,
  ];
  
  late List<List<List<List<List<String>>>>> contentsTable22ValueIndex = [
    koreanTable22.koreanTableGradeValueIndex,
    mathTable22.mathTableGradeValueIndex,
    societyTable22.societyTableGradeValueIndex,
    scienceTable22.scienceTableGradeValueIndex,
    englishTable22.englishTableGradeValueIndex,
    peTable22.peTableGradeValueIndex,
    artTable22.artTableGradeValueIndex,
    // musicTable22.musicTableGradeValueIndex,
    // ethicsTable22.ethicsTableGradeValueIndex,
    // practicalTable22.practicalTableGradeValueIndex,
    // combinedSubjectTable22.combinedSubjectTableGradeValueIndex,
  ];
}

class TableCategory22 {
  List<String> tableGrade = ['1~2학년', '3~4학년', '5~6학년'];
  List<String> tableCategory = ['지식·이해', '과정·기능', '가치·태도'];
}
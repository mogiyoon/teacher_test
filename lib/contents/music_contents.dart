import 'package:teacher_test/contents/contents.dart';

class MusicAchieve22 {
  late List<List<String>> musicAchieveIndex = [
    musicAchieve12,
    musicAchieve34,
    musicAchieve56
  ];

  late List<String> musicAchieve =
      musicAchieve12 + musicAchieve34 + musicAchieve56;

  late List<String> musicAchieve12 =
      musicAchievePlay12 + musicAchieveEnjoy12 + musicAchieveCreate12;

  late List<String> musicAchieve34 =
      musicAchievePlay34 + musicAchieveEnjoy34 + musicAchieveCreate34;

  late List<String> musicAchieve56 =
      musicAchievePlay56 + musicAchieveEnjoy56 + musicAchieveCreate56;

  List<String> musicAchievePlay12 = [];
  List<String> musicAchieveEnjoy12 = [];
  List<String> musicAchieveCreate12 = [];

  //2022 음악 1~2년 성취기준

  List<String> musicAchievePlay34 = [
    '바른 자세와 주법을 익혀 노래 부르거나 악기로 연주한다.',
    '기초적인 음악 요소를 살려 노래 부르거나 악기로 연주하고 느낌을 이야기한다.',
    '노래와 악기 연주에 어울리는 신체표현이나 놀이를 하며 음악을 즐긴다.',
    '생활 속에서 음악을 경험하며 연주에 관심을 가지고 참여한다.',
  ];
  List<String> musicAchieveEnjoy34 = [
    '음악을 듣고 기초적인 음악 요소를 탐색하며 반응한다.',
    '다양한 음악을 듣고 음악적 특징을 발견한다.',
    '다양한 종류의 음악을 듣고 음악의 분위기를 묘사하거나 쓰임을 이야기한다.',
    '생활 속에서 음악을 들으며 느낌과 호기심을 갖고 즐긴다.',
    '우리 지역의 음악 문화유산을 찾아 듣고 국악을 즐기는 태도를 갖는다.',
  ];
  List<String> musicAchieveCreate34 = [
    '느낌과 상상을 즉흥적으로 표현하며 음악에 대한 흥미를 갖는다.',
    '악곡의 일부를 바꾸어 표현하고 간단한 악보로 나타낸다.',
    '기초적인 음악 요소를 활용하여 소리나 음악으로 표현한다.',
    '생활 주변의 소리나 장면을 모방하며 음악의 새로움을 즐기는 태도를 갖는다.',
  ];

  //2022 음악 3~4년 성취기준

  List<String> musicAchievePlay56 = [
    '바른 주법과 표현 기법을 익혀 노래나 악기로 느낌을 담아 연주한다.',
    '음악 요소를 살려 노래나 악기로 발표하고 과정을 돌아본다.',
    '소리의 어울림을 생각하며 다양한 방법으로 함께 표현한다.',
    '간단한 형태의 연주를 준비하여 생활 속 음악 활동에 참여한다.',
  ];
  List<String> musicAchieveEnjoy56 = [
    '음악을 듣고 음악의 요소를 감지하며 구별한다.',
    '다양한 문화권의 음악을 듣고 음악적 특징과 음악의 간단한 구성을 인식한다.',
    '다양한 종류의 음악을 듣고 음악의 배경과 활용을 설명한다.',
    '생활 속에서 음악을 찾아 들으며 아름다움을 느끼고 공감한다.',
    '우리나라 음악 문화유산을 찾아 듣고 국악의 가치를 인식한다.',
  ];
  List<String> musicAchieveCreate56 = [
    '느낌과 아이디어를 떠올려 여러 매체나 방법으로 자신감 있게 표현한다.',
    '기초적인 기보를 활용하여 간단한 조건에 따라 악곡의 일부를 바꾼다.',
    '음악의 요소를 활용하여 간단한 음악을 만든다.',
    '생활 주변 상황이나 이야기를 활용하여 음악을 만들며 열린 태도를 갖는다.',
  ];
//2022 음악 5~6년 성취기준
}

class MusicTable22 {
  List<String> tableGrade = TableCategory22().tableGrade;
  List<String> tableCategory = TableCategory22().tableCategory;

  List<String> musicTableArea = ['연주', '감상', '창작'];

  late List<List<List<String>>> musicTableAreaIndex = [
    musicTablePlayCategoryIndex,
    musicTableEnjoyCategoryIndex,
    musicTableCreateCategoryIndex,
  ];

  late List<List<String>> musicTableCIIndex = [
    musicTablePlayCI,
    musicTableEnjoyCI,
    musicTableCreateCI,
  ];

  late List<List<String>> musicTableLowerCategoryIndex = [
    musicTablePlayLowerCategory,
    musicTableEnjoyLowerCategory,
    musicTableCreateLowerCategory,
  ];

  late List<List<List<List<String>>>> musicTableGradeValueIndex = [
    musicTableOneTwoValueIndex,
    musicTableThreeFourValueIndex,
    musicTableFiveSixValueIndex,
  ];

  late List<List<List<String>>> musicTableOneTwoValueIndex = [
    musicTablePlayOneTwoValue,
    musicTableEnjoyOneTwoValue,
    musicTableCreateOneTwoValue,
  ];

  late List<List<List<String>>> musicTableThreeFourValueIndex = [
    musicTablePlayThreeFourValue,
    musicTableEnjoyThreeFourValue,
    musicTableCreateThreeFourValue,
  ];

  late List<List<List<String>>> musicTableFiveSixValueIndex = [
    musicTablePlayFiveSixValue,
    musicTableEnjoyFiveSixValue,
    musicTableCreateFiveSixValue,
  ];

  late List<List<String>> musicTablePlayCategoryIndex = [
    musicTablePlayKnowledgeLowerCategory,
    musicTablePlayProcessLowerCategory,
    musicTablePlayWorthLowerCategory
  ];

  late List<String> musicTablePlayLowerCategory =
      musicTablePlayKnowledgeLowerCategory +
          musicTablePlayProcessLowerCategory +
          musicTablePlayWorthLowerCategory;

  List<String> musicTablePlayKnowledgeLowerCategory = [''];
  List<String> musicTablePlayProcessLowerCategory = [''];
  List<String> musicTablePlayWorthLowerCategory = [''];
  List<String> musicTablePlayCI = [
    '음악은 고유한 방식과 원리에 따라 인간의 느낌, 생각, 경험을 다양한 소리의 어울림으로 표현한 것이다.',
    '개인적 혹은 협력적 음악 연주는 인간의 감수성과 사회⋅문화적 배경에 따라 다양한 행위 과정으로 나타난다.',
    '인간은 생활 속에서 다양한 음악 매체와 표현 방법을 활용하여 함께 경험하며 소통한다.',
  ];
  List<List<String>> musicTablePlayOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 미술 연주 1~2년 내용체계
  List<List<String>> musicTablePlayThreeFourValue = [
    [
      '생활 속의 음악',
      '기초적인 음악 요소',
      '자세와 주법',
      '느낌, 여러 소리',
    ],
    [
      '노래 부르거나 악기 연주하기',
      '신체로 표현하고 놀이하기',
      '발표하고 이야기하기',
    ],
    [
      '연주를 즐기는 태도',
      '연주에 대한 관심',
    ]
  ]; //2022 미술 연주 3~4년 내용체계
  List<List<String>> musicTablePlayFiveSixValue = [
    [
      '간단한 악곡의 연주 형태',
      '음악 요소',
      '주법과 표현 기법',
      '어울림, 여러 악기',
    ],
    [
      '노래 부르거나 악기 연주하기',
      '다양한 방법으로 표현하기',
      '발표하고 돌아보기',
    ],
    [
      '음악으로 함께하는 태도',
      '연주 준비와 참여',
    ],
  ]; //2022 미술 연주 5~6년 내용체계
//2022 미술 연주 내용체계표

  late List<List<String>> musicTableEnjoyCategoryIndex = [
    musicTableEnjoyKnowledgeLowerCategory,
    musicTableEnjoyProcessLowerCategory,
    musicTableEnjoyWorthLowerCategory
  ];

  late List<String> musicTableEnjoyLowerCategory =
      musicTableEnjoyKnowledgeLowerCategory +
          musicTableEnjoyProcessLowerCategory +
          musicTableEnjoyWorthLowerCategory;

  List<String> musicTableEnjoyKnowledgeLowerCategory = [''];
  List<String> musicTableEnjoyProcessLowerCategory = [''];
  List<String> musicTableEnjoyWorthLowerCategory = [''];
  List<String> musicTableEnjoyCI = [
    '음악은 고유한 방식과 원리에 따라 다양한 속성을 청각적 형태로 구현한 것이다.',
    '음악적 수용과 반응은 인간의 감수성과 사회⋅문화적 배경에 따라 다양하게 나타난다.',
    '인간은 생활 속에서 다양한 음악 경험을 통해 미적 가치와 의미를 발견하고 공감한다.',
  ];
  List<List<String>> musicTableEnjoyOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 미술 감상 1~2년 내용체계
  List<List<String>> musicTableEnjoyThreeFourValue = [
    [
      '다양한 종류의 음악',
      '지역의 음악 문화유산',
      '기초적인 음악 요소',
      '음악적 특징',
      '느낌, 분위기, 쓰임',
    ],
    [
      '반응하며 듣기',
      '탐색하고 발견하기',
      '묘사하거나 이야기하기',
    ],
    [
      '소리와 음악을 즐기는 태도',
      '음악에 대한 호기심',
    ],
  ]; //2022 미술 감상 3~4년 내용체계
  List<List<String>> musicTableEnjoyFiveSixValue = [
    [
      '다양한 종류와 문화권의 음악',
      '우리나라 음악 문화유산',
      '음악 요소',
      '음악적 특징, 음악의 간단한 구성',
      '느낌, 배경, 활용',
    ],
    [
      '감지하며 듣기',
      '인식하고 구별하기',
      '설명하기',
    ],
    [
      '음악의 아름다움에 대한 인식',
      '음악에 대한 공감',
    ]
  ]; //2022 미술 감상 5~6년 내용체계
//2022 미술 감상 내용체계표

  late List<List<String>> musicTableCreateCategoryIndex = [
    musicTableCreateKnowledgeLowerCategory,
    musicTableCreateProcessLowerCategory,
    musicTableCreateWorthLowerCategory
  ];

  late List<String> musicTableCreateLowerCategory =
      musicTableCreateKnowledgeLowerCategory +
          musicTableCreateProcessLowerCategory +
          musicTableCreateWorthLowerCategory;

  List<String> musicTableCreateKnowledgeLowerCategory = [''];
  List<String> musicTableCreateProcessLowerCategory = [''];
  List<String> musicTableCreateWorthLowerCategory = [''];
  List<String> musicTableCreateCI = [
    '음악은 고유한 방식과 원리에 따라 인간의 무한한 상상과 가능성을 탐구하여 만들어낸 것이다.',
    '개인적 혹은 협력적 음악 창작은 인간의 감수성과 사회⋅문화적 배경에 따라 다양한 과정과 결과물로 나타난다.',
    '인간은 생활 속에서 다양한 매체와 방법을 활용하여 자기 주도적으로 음악을 구성하며 기여한다.',
  ];
  List<List<String>> musicTableCreateOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 미술 창작 1~2년 내용체계
  List<List<String>> musicTableCreateThreeFourValue = [
    [
      '소리와 음악',
      '기초적인 음악 요소',
      '간단한 악보',
      '느낌, 상상',
    ],
    [
      '즉흥적으로 표현하기',
      '부분적으로 바꾸기',
      '모방하여 나타내기',
    ],
    [
      '음악에 대한 흥미',
      '음악의 새로움을 즐기는 태도',
    ]
  ]; //2022 미술 창작 3~4년 내용체계
  List<List<String>> musicTableCreateFiveSixValue = [
    [
      '간단한 음악',
      '음악 요소',
      '기초적인 기보, 음악 매체',
      '느낌, 아이디어',
    ],
    [
      '떠올리며 표현하기',
      '간단한 조건에 따라 바꾸기',
      '활용하여 만들기',
    ],
    [
      '음악에 대한 자신감',
      '음악에 대한 열린 태도',
    ],
  ]; //2022 미술 창작 5~6년 내용체계
//2022 미술 창작 내용체계표
}

import 'package:teacher_test/contents/contents.dart';

class CombinedSubjectAchieve22 {
  late List<List<String>> combinedSubjectAchieveIndex = [
    combinedSubjectAchieveStraight,
    combinedSubjectAchieveWise,
    combinedSubjectAchievePleasant
  ];

  late List<String> combinedSubjectAchieve = combinedSubjectAchieveStraight +
      combinedSubjectAchieveWise +
      combinedSubjectAchievePleasant;

  late List<String> combinedSubjectAchieveStraight =
      combinedSubjectAchieveWhoStraight +
          combinedSubjectAchieveWhereStraight +
          combinedSubjectAchieveHowStraight +
          combinedSubjectAchieveWhatStraight;

  late List<String> combinedSubjectAchieveWise = combinedSubjectAchieveWhoWise +
      combinedSubjectAchieveWhereWise +
      combinedSubjectAchieveHowWise +
      combinedSubjectAchieveWhatWise;

  late List<String> combinedSubjectAchievePleasant =
      combinedSubjectAchieveWhoPleasant +
          combinedSubjectAchieveWherePleasant +
          combinedSubjectAchieveHowPleasant +
          combinedSubjectAchieveWhatPleasant;

  List<String> combinedSubjectAchieveWhoStraight = [
    '학교 생활 습관과 학습 습관을 형성하여 안전하고 건강하게 생활한다.',
    '나를 이해하고 존중하며 생활한다.',
    '가족이나 주변 사람을 배려하며 관계를 맺는다.',
    '생태환경에서 더불어 살기 위해 노력한다.',
  ];
  List<String> combinedSubjectAchieveWhereStraight = [
    '공동체에서 내가 할 수 있는 일을 찾아보고 실천한다.',
    '우리나라의 소중함을 알고 사랑하는 마음을 기른다.',
    '차이나 다양성을 서로 존중하면서 생활한다.',
    '새로운 활동에 호기심을 갖고 도전한다.',
  ];
  List<String> combinedSubjectAchieveHowStraight = [
    '하루의 가치를 느끼며 지금을 소중히 여긴다.',
    '계절의 변화에 대응하며 생활한다.',
    '여러 인물의 삶을 통해 공동체성을 기른다.',
    '공동체 속에서 지속가능성을 위한 삶의 방식을 찾아 실천한다.',
  ];
  List<String> combinedSubjectAchieveWhatStraight = [
    '모두를 위한 생활환경을 만드는 데 참여한다.',
    '다양한 생각이나 의견에 대해 개방적인 태도를 형성한다.',
    '여럿이 하는 활동에 관심을 갖고 자발적으로 협력한다.',
    '지금까지의 생활 습관과 학습 습관을 되돌아본다.',
  ];

  //2022 바른 생활 1~2년 성취기준

  List<String> combinedSubjectAchieveWhoWise = [
    '학교 안팎의 모습과 생활을 탐색하며 안전한 학교 생활을 한다.',
    '나를 탐색하여 나에 대해 설명한다.',
    '가족이나 주변 사람에게 관심을 갖고 함께 살아가는 모습을 탐구한다.',
    '사람과 자연, 동식물이 어우러져 사는 생태를 탐구한다.',
  ];
  List<String> combinedSubjectAchieveWhereWise = [
    '우리가 살고 있는 마을과 사람들이 생활하는 모습을 살펴본다.',
    '우리나라의 모습이나 문화를 조사한다.',
    '알고 싶은 나라를 탐구하며 다른 나라에 관심을 갖는다.',
    '궁금한 세계를 다양한 매체로 탐색한다.',
  ];
  List<String> combinedSubjectAchieveHowWise = [
    '하루의 변화와 사람들이 하루를 살아가는 모습을 탐색한다.',
    '계절과 생활의 관계를 탐구한다.',
    '관심 있는 대상의 과거와 현재를 살펴보고 미래를 상상한다.',
    '우리의 생활과 관련된 지속가능성의 다양한 사례를 찾고 탐색한다.',
  ];
  List<String> combinedSubjectAchieveWhatWise = [
    '생활도구의 모양이나 기능을 탐색하고 바꾸어본다.',
    '상상한 것을 다양한 매체와 재료로 구현한다.',
    '경험한 것 중에서 관심 있는 주제를 정하고 조사한다.',
    '배운 것과 배울 것을 연결하며 앞으로의 배움을 상상한다.',
  ];

  //2022 슬기로운 생활 1~2년 성취기준

  List<String> combinedSubjectAchieveWhoPleasant = [
    '즐겁게 놀이하며, 건강하고 안전하게 생활한다.',
    '놀이하며 내 몸의 움직임이나 감각을 느낀다.',
    '가족이나 주변 사람과 소통하며 어울린다.',
    '우리를 둘러싼 자연의 아름다움을 감상한다.',
  ];
  List<String> combinedSubjectAchieveWherePleasant = [
    '내가 참여할 수 있는 문화 예술을 향유한다.',
    '우리나라의 문화 예술을 즐긴다.',
    '다른 나라의 문화 예술을 체험한다.',
    '다양한 세상을 상상하고 표현한다.',
  ];
  List<String> combinedSubjectAchieveHowPleasant = [
    '하루를 건강하고 활기차게 지낸다.',
    '자연의 변화를 느끼며 놀이한다.',
    '전통문화를 새롭게 표현한다.',
    '안전과 안녕을 위한 아동의 권리가 있음을 알고 누린다.',
  ];
  List<String> combinedSubjectAchieveWhatPleasant = [
    '주변의 물건을 활용하여 놀잇감을 만든다.',
    '자유롭게 상상하며 놀이한다.',
    '생각이나 느낌을 살려 전시나 공연 활동을 한다.',
    '기억에 남는 경험을 떠올리며 의미를 부여한다.',
  ];
//2022 즐거운 생활 1~2년 성취기준
}

class CombinedSubjectTable22 {
  List<String> tableGrade = TableCategory22().tableGrade;
  List<String> tableCategory = TableCategory22().tableCategory;

  List<String> combinedSubjectTableArea = [
    '우리는 누구로 살아갈까',
    '우리는 어디서 살아갈까',
    '우리는 지금 어떻게 살아갈까',
    '우리는 무엇을 하며 살아갈까'
  ];

  late List<List<List<String>>> combinedSubjectTableAreaIndex = [
    combinedSubjectTableWhoCategoryIndex,
    combinedSubjectTableWhereCategoryIndex,
    combinedSubjectTableHowCategoryIndex,
    combinedSubjectTableWhatCategoryIndex
  ];

  late List<List<String>> combinedSubjectTableCIIndex = [
    combinedSubjectTableWhoCI,
    combinedSubjectTableWhereCI,
    combinedSubjectTableHowCI,
    combinedSubjectTableWhatCI
  ];

  late List<List<String>> combinedSubjectTableLowerCategoryIndex = [
    combinedSubjectTableWhoLowerCategory,
    combinedSubjectTableWhereLowerCategory,
    combinedSubjectTableHowLowerCategory,
    combinedSubjectTableWhatLowerCategory,
  ];

  late List<List<List<List<String>>>> combinedSubjectTableGradeValueIndex = [
    combinedSubjectTableStraightValueIndex,
    combinedSubjectTableWiseValueIndex,
    combinedSubjectTablePleasantValueIndex,
  ];

  late List<List<List<String>>> combinedSubjectTableStraightValueIndex = [
    combinedSubjectTableWhoStraightValue,
    combinedSubjectTableWhereStraightValue,
    combinedSubjectTableHowStraightValue,
    combinedSubjectTableWhatStraightValue,
  ];

  late List<List<List<String>>> combinedSubjectTableWiseValueIndex = [
    combinedSubjectTableWhoWiseValue,
    combinedSubjectTableWhereWiseValue,
    combinedSubjectTableHowWiseValue,
    combinedSubjectTableWhatWiseValue,
  ];

  late List<List<List<String>>> combinedSubjectTablePleasantValueIndex = [
    combinedSubjectTableWhoPleasantValue,
    combinedSubjectTableWherePleasantValue,
    combinedSubjectTableHowPleasantValue,
    combinedSubjectTableWhatPleasantValue,
  ];

  late List<List<String>> combinedSubjectTableWhoCategoryIndex = [
    combinedSubjectTableWhoKnowledgeLowerCategory,
    combinedSubjectTableWhoProcessLowerCategory,
    combinedSubjectTableWhoWorthLowerCategory
  ];

  late List<String> combinedSubjectTableWhoLowerCategory =
      combinedSubjectTableWhoKnowledgeLowerCategory +
          combinedSubjectTableWhoProcessLowerCategory +
          combinedSubjectTableWhoWorthLowerCategory;

  List<String> combinedSubjectTableWhoKnowledgeLowerCategory = [''];
  List<String> combinedSubjectTableWhoProcessLowerCategory = [''];
  List<String> combinedSubjectTableWhoWorthLowerCategory = [''];
  List<String> combinedSubjectTableWhoCI = [
    '우리는 내가 누구인지 생각하며 생활한다.',
    '우리는 서로 관계를 맺으며 생활한다.',
  ];
  List<List<String>> combinedSubjectTableWhoStraightValue = [
    [
      '학교 생활 습관과 학습 습관',
      '자기 이해',
      '생태환경',
    ],
    [
      '습관 형성하기',
      '관계 맺기',
    ],
    [
      '안전하고 건강한 생활',
      '자기 존중',
      '배려',
      '더불어 사는 삶',
    ],
  ]; //2022 통합 우리는 누구로 살아갈까 바른 생활 내용체계
  List<List<String>> combinedSubjectTableWhoWiseValue = [
    [
      '학교 안팎의 모습과 생활',
      '자아인식',
      '가족과 주변 사람',
      '사람⋅자연⋅동식물',
    ],
    [
      '탐색하기',
      '설명하기',
      '탐구하기',
    ],
    [
      '안전한 학교생활',
    ],
  ]; //2022 통합 우리는 누구로 살아갈까 슬기로운 생활 내용체계
  List<List<String>> combinedSubjectTableWhoPleasantValue = [
    [
      '건강과 안전',
      '신체 인식과 감각',
      '자연의 아름다운 장면',
    ],
    [
      '놀이하기',
      '소통하기',
      '감상하기',
    ],
    [
      '어울림',
      '건강한 생활',
      '안전한 생활',
    ],
  ]; //2022 통합 우리는 누구로 살아갈까 즐거운 생활 내용체계
//2022 통합 우리는 누구로 살아갈까 내용체계표

  late List<List<String>> combinedSubjectTableWhereCategoryIndex = [
    combinedSubjectTableWhereKnowledgeLowerCategory,
    combinedSubjectTableWhereProcessLowerCategory,
    combinedSubjectTableWhereWorthLowerCategory
  ];

  late List<String> combinedSubjectTableWhereLowerCategory =
      combinedSubjectTableWhereKnowledgeLowerCategory +
          combinedSubjectTableWhereProcessLowerCategory +
          combinedSubjectTableWhereWorthLowerCategory;

  List<String> combinedSubjectTableWhereKnowledgeLowerCategory = [''];
  List<String> combinedSubjectTableWhereProcessLowerCategory = [''];
  List<String> combinedSubjectTableWhereWorthLowerCategory = [''];
  List<String> combinedSubjectTableWhereCI = [
    '우리는 여러 공동체 속에서 생활한다.',
    '우리는 삶의 공간을 넓히며 생활한다.',
  ];
  List<List<String>> combinedSubjectTableWhereStraightValue = [
    [
      '공동체 생활 모습'
          '우리나라의 소중함'
    ],
    [
      '실천하기',
      '호기심 갖기',
    ],
    [
      '나라 사랑',
      '다양성 존중',
      '적극성과 도전의식',
    ]
  ]; //2022 통합 우리는 어디서 살아갈까 바른 생활 내용체계
  List<List<String>> combinedSubjectTableWhereWiseValue = [
    [
      '마을의 모습과 생활',
      '우리나라의 모습과 문화',
      '다른 나라의 모습과 문화',
      '궁금한 세계',
    ],
    [
      '살펴보기',
      '조사하기',
      '탐구하기',
      '매체 활용하기',
      '탐색하기',
    ],
    [
      '관심',
      '호기심',
    ],
  ]; //2022 통합 우리는 어디서 살아갈까 슬기로운 생활 내용체계
  List<List<String>> combinedSubjectTableWherePleasantValue = [
    [
      '우리나라의 문화 예술',
      '다른 나라의 문화 예술',
    ],
    [
      '문화 예술 활동하기',
      '표현하기',
      '상상하기',
    ],
    [
      '문화 예술 향유',
    ],
  ]; //2022 통합 우리는 어디서 살아갈까 즐거운 생활 내용체계
//2022 통합 우리는 어디서 살아갈까 내용체계표

  late List<List<String>> combinedSubjectTableHowCategoryIndex = [
    combinedSubjectTableHowKnowledgeLowerCategory,
    combinedSubjectTableHowProcessLowerCategory,
    combinedSubjectTableHowWorthLowerCategory
  ];

  late List<String> combinedSubjectTableHowLowerCategory =
      combinedSubjectTableHowKnowledgeLowerCategory +
          combinedSubjectTableHowProcessLowerCategory +
          combinedSubjectTableHowWorthLowerCategory;

  List<String> combinedSubjectTableHowKnowledgeLowerCategory = [''];
  List<String> combinedSubjectTableHowProcessLowerCategory = [''];
  List<String> combinedSubjectTableHowWorthLowerCategory = [''];
  List<String> combinedSubjectTableHowCI = [
    '우리는 여러 유형의 주기로 생활한다.',
    '우리는 과거, 현재, 미래를 생각하며 생활한다.',
  ];
  List<List<String>> combinedSubjectTableHowStraightValue = [
    [
      '인물의 삶',
      '지속가능한 삶의 방식',
    ],
    [
      '하루 생활 관리하기',
      '변화에 대응하기',
      '실천하기',
    ],
    [
      '시간의 가치',
      '적절성',
      '공동체성',
      '지속가능성',
    ]
  ]; //2022 통합 우리는 지금 어떻게 살아갈까 바른 생활 내용체계
  List<List<String>> combinedSubjectTableHowWiseValue = [
    [
      '하루의 변화와 생활',
      '계절과 생활',
      '과거-현재-미래',
    ],
    [
      '탐색하기',
      '탐구하기',
      '살펴보기',
    ],
    [
      '상상력',
    ]
  ]; //2022 통합 우리는 지금 어떻게 살아갈까 슬기로운 생활 내용체계
  List<List<String>> combinedSubjectTableHowPleasantValue = [
    [
      '자연의 변화',
      '전통문화',
      '아동권리',
    ],
    [
      '자연에서 놀이하기',
      '창의적으로 표현하기',
      '권리 누리기',
    ],
    [
      '활기찬 생활',
      '전통의 소중함',
      '안전과 안녕',
    ],
  ]; //2022 통합 우리는 지금 어떻게 살아갈까 즐거운 생활 내용체계
//2022 통합 우리는 지금 어떻게 살아갈까 내용체계표

  late List<List<String>> combinedSubjectTableWhatCategoryIndex = [
    combinedSubjectTableWhatKnowledgeLowerCategory,
    combinedSubjectTableWhatProcessLowerCategory,
    combinedSubjectTableWhatWorthLowerCategory
  ];

  late List<String> combinedSubjectTableWhatLowerCategory =
      combinedSubjectTableWhatKnowledgeLowerCategory +
          combinedSubjectTableWhatProcessLowerCategory +
          combinedSubjectTableWhatWorthLowerCategory;

  List<String> combinedSubjectTableWhatKnowledgeLowerCategory = [''];
  List<String> combinedSubjectTableWhatProcessLowerCategory = [''];
  List<String> combinedSubjectTableWhatWorthLowerCategory = [''];
  List<String> combinedSubjectTableWhatCI = [
    '우리는 경험 하고 상상하고 만들며 생활한다.',
    '우리는 느끼고 생각하고 표현하며 생활한다.',
  ];
  List<List<String>> combinedSubjectTableWhatStraightValue = [
    [
      '모두를 위한 생활 환경',
      '학습 습관',
      '생활 습관',
    ],
    [
      '참여하기',
      '생각이나 의견 나누기',
      '협력하기',
      '되돌아보기',
    ],
    [
      '모두를 위한 마음',
      '개방성',
      '자발성',
    ],
  ]; //2022 통합 우리는 무엇을 하며 살아갈까 바른 생활 내용체계
  List<List<String>> combinedSubjectTableWhatWiseValue = [
    [
      '생활 도구의 모양과 기능',
      '다양한 매체와 재료',
      '관심 주제',
      '배운 것과 배울 것',
    ],
    [
      '바꾸기',
      '매체 활용하기',
      '상상하여 구현하기',
      '조사하기',
      '연결하기',
      '탐색하기',
    ],
    [
      '창의성',
    ],
  ]; //2022 통합 우리는 무엇을 하며 살아갈까 슬기로운 생활 내용체계
  List<List<String>> combinedSubjectTableWhatPleasantValue = [
    [
      '생각과 느낌',
    ],
    [
      '고치기와 만들기',
      '놀이하기',
      '전시하기',
      '공연하기',
      '경험 떠올리기',
    ],
    [
      '자유로운 상상',
      '의미 부여',
    ],
  ]; //2022 통합 우리는 무엇을 하며 살아갈까 즐거운 생활 내용체계
//2022 통합 우리는 무엇을 하며 살아갈까 내용체계표
}

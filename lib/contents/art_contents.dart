import 'package:teacher_test/contents/contents.dart';

class ArtAchieve22 {
  late List<List<String>> artAchieveIndex = [
    artAchieve12,
    artAchieve34,
    artAchieve56
  ];

  late List<String> artAchieve = artAchieve12 + artAchieve34 + artAchieve56;

  late List<String> artAchieve12 =
      artAchieveExper12 + artAchieveExpre12 + artAchieveAppre12;

  late List<String> artAchieve34 =
      artAchieveExperl34 + artAchieveExpre34 + artAchieveAppre34;

  late List<String> artAchieve56 =
      artAchieveExperl56 + artAchieveExpre56 + artAchieveAppre56;

  List<String> artAchieveExper12 = [];
  List<String> artAchieveExpre12 = [];
  List<String> artAchieveAppre12 = [];

  //2022 미술 1~2년 성취기준

  List<String> artAchieveExperl34 = [
    '자연물과 인공물을 탐색하는 데 다양한 감각을 활용할 수 있다.',
    '주변 대상을 체험하며 떠오른 느낌과 생각을 다양한 방법으로 나타낼 수 있다.',
    '미적 탐색에 호기심을 갖고 참여하며 자신의 감각으로 대상의 특징을 이해할 수 있다.',
    '생활 속에서 활용되는 미술에 관심을 가지고 미술의 특징과 역할을 발견할 수 있다.'
  ];
  List<String> artAchieveExpre34 = [
    '관찰과 상상으로 아이디어를 떠올려 표현 주제를 구체화할 수 있다.',
    '기본적인 표현 재료와 용구의 특성을 이해하고 사용 방법을 익힐 수 있다.',
    '조형 요소의 특징을 자유롭게 탐색하며 주제 표현에 알맞게 활용할 수 있다.',
    '표현 의도를 가지고 작품을 제작하며 자기 작품을 소중히 여길 수 있다.',
    '미술과 타 교과를 관련지어 주제를 표현하는데 흥미를 가질 수 있다.'
  ];
  List<String> artAchieveAppre34 = [
    '미술 작품을 자세히 보고 작품과 미술가에 관해 질문할 수 있다.',
    '미술 작품의 특징과 작품에 관한 자신의 느낌과 생각을 설명할 수 있다.',
    '미술 문화에 관심을 가지고 전시 및 행사에 참여할 수 있다.',
    '작품 감상에 흥미를 가지고 참여하며 작품에 대한 자신의 감상 관점을 존중할 수 있다.'
  ];

  //2022 미술 3~4년 성취기준

  List<String> artAchieveExperl56 = [
    '다양한 감각과 매체를 활용하여 자신과 대상을 탐색할 수 있다.',
    '자신이나 주변 환경에서 찾은 감각적 특징, 느낌, 생각 등을 관련지어 나타낼 수 있다.',
    '주변 환경에 대한 민감한 태도로 대상과 상호 작용하며 새로운 의미를 발견할 수 있다.',
    '이미지가 나타내는 의미를 비판적으로 이해하고 느낌과 생각을 전달하는 데 활용할 수 있다.'
  ];
  List<String> artAchieveExpre56 = [
    '다양한 방법으로 아이디어를 연결하여 확장된 표현 주제로 발전시킬 수 있다.',
    '디지털 매체 등 다양한 표현 재료와 용구를 탐색하여 작품 제작에 활용할 수 있다.',
    '조형 요소의 어울림을 통해 조형 원리를 이해하고 주제 표현에 연결할 수 있다.',
    '주제 표현에 의지를 갖고 표현 과정을 돌아보며 작품을 발전시킬 수 있다.',
    '미술과 타 교과의 내용과 방법을 융합하는 활동을 자유롭게 시도할 수 있다.'
  ];
  List<String> artAchieveAppre56 = [
    '미술 작품을 작품이 만들어진 시대적, 지역적 배경 등과 연결하여 이해할 수 있다.',
    '미술 작품의 내용(소재, 주제 등)과 형식(재료와 용구, 표현 방법, 조형 요소와 원리 등)을 분석하여 작품의 특징을 설명할 수 있다.',
    '공동체의 미술 문화 활동에 관심을 가지고 참여하며 경험을 공유할 수 있다.',
    '다양한 방법을 활용하여 작품을 감상하며 작품에 관한 서로 다른 관점을 존중할 수 있다.'
  ];
//2022 미술 5~6년 성취기준
}

class ArtTable22 {
  List<String> tableGrade = TableCategory22().tableGrade;
  List<String> tableCategory = TableCategory22().tableCategory;

  List<String> artTableArea = ['미적 체험', '표현', '감상'];

  late List<List<List<String>>> artTableAreaIndex = [
    artTableExperCategoryIndex,
    artTableExpreCategoryIndex,
    artTableAppreCategoryIndex,
  ];

  late List<List<String>> artTableCIIndex = [
    artTableExperCI,
    artTableExpreCI,
    artTableAppreCI,
  ];

  late List<List<String>> artTableLowerCategoryIndex = [
    artTableExperLowerCategory,
    artTableExpreLowerCategory,
    artTableAppreLowerCategory,
  ];

  late List<List<List<List<String>>>> artTableGradeValueIndex = [
    artTableOneTwoValueIndex,
    artTableThreeFourValueIndex,
    artTableFiveSixValueIndex,
  ];

  late List<List<List<String>>> artTableOneTwoValueIndex = [
    artTableExperOneTwoValue,
    artTableExpreOneTwoValue,
    artTableAppreOneTwoValue,
  ];

  late List<List<List<String>>> artTableThreeFourValueIndex = [
    artTableExperThreeFourValue,
    artTableExpreThreeFourValue,
    artTableAppreThreeFourValue,
  ];

  late List<List<List<String>>> artTableFiveSixValueIndex = [
    artTableExperFiveSixValue,
    artTableExpreFiveSixValue,
    artTableAppreFiveSixValue,
  ];

  late List<List<String>> artTableExperCategoryIndex = [
    artTableExperKnowledgeLowerCategory,
    artTableExperProcessLowerCategory,
    artTableExperWorthLowerCategory
  ];

  late List<String> artTableExperLowerCategory =
      artTableExperKnowledgeLowerCategory +
          artTableExperProcessLowerCategory +
          artTableExperWorthLowerCategory;

  List<String> artTableExperKnowledgeLowerCategory = [''];
  List<String> artTableExperProcessLowerCategory = [''];
  List<String> artTableExperWorthLowerCategory = [''];
  List<String> artTableExperCI = [
    '미적 체험은 감각을 깨워 미적 감수성을 풍부하게 하며 미적 가치를 발견하도록 한다.',
    '대상과 현상을 관찰하고 지각하는 경험은 앎을 확장하고 자신을 성찰하게 한다.',
    '이미지에 대한 비판적 이해는 시각적 소통과 문화적 참여의 토대가 된다.',
  ];
  List<List<String>> artTableExperOneTwoValue = [
    ['']
  ]; //2022 미술 미적 체험 1~2년 내용체계
  List<List<String>> artTableExperThreeFourValue = [
    [
      '자신의 감각',
      '대상의 특징',
      '생활 속 미술',
    ],
    [
      '감각을 활용하여 탐색하기',
      '대상에 반응하여 느낌과 생각을 나타내기',
      '미술의 특징과 역할을 발견하기',
    ],
    [
      '미적 탐색에 대한 호기심',
      '미술의 역할에 관한 관심',
    ]
  ]; //2022 미술 미적 체험 3~4년 내용체계
  List<List<String>> artTableExperFiveSixValue = [
    [
      '감각과 매체의 역할',
      '자신과 환경의 관계',
      '이미지와 의미',
    ],
    [
      '감각과 매체를 활용하여 탐색하기',
      '대상과 상호 작용하며 의미 발견하기',
      '이미지를 해석하고 활용하기',
    ],
    [
      '주변 환경에 대한 민감성',
      '비판적으로 이해하는 태도',
    ],
  ]; //2022 미술 미적 체험 5~6년 내용체계
//2022 미술 미적 체험 내용체계표

  late List<List<String>> artTableExpreCategoryIndex = [
    artTableExpreKnowledgeLowerCategory,
    artTableExpreProcessLowerCategory,
    artTableExpreWorthLowerCategory
  ];

  late List<String> artTableExpreLowerCategory =
      artTableExpreKnowledgeLowerCategory +
          artTableExpreProcessLowerCategory +
          artTableExpreWorthLowerCategory;

  List<String> artTableExpreKnowledgeLowerCategory = [''];
  List<String> artTableExpreProcessLowerCategory = [''];
  List<String> artTableExpreWorthLowerCategory = [''];
  List<String> artTableExpreCI = [
    '표현은 자신의 느낌과 생각을 시각화하는 창의적 사고와 성찰의 순환 과정으로 이루어진다.',
    '다양한 발상은 아이디어와 주제를 발전시키고 표현의 토대가 된다.',
    '작품 제작은 표현 재료와 방법, 조형 요소와 원리 등을 선택하고 활용하여 창의적으로 문제를 해결하는 과정을 통해 예술적 성취를 경험하게 한다.',
  ];
  List<List<String>> artTableExpreOneTwoValue = [
    [''],
  ]; //2022 미술 표현 1~2년 내용체계
  List<List<String>> artTableExpreThreeFourValue = [
    [
      '표현 주제',
      '기본적인 표현 재료와 용구',
      '조형 요소의 특징',
    ],
    [
      '관찰과 상상으로 아이디어를 떠올리기',
      '표현 방법을 익히기',
      '의도를 가지고 작품을 제작하기',
      '타 교과와 관련짓기',
    ],
    [
      '표현에 대한 흥미',
      '자기 작품을 소중히 여기는 태도',
    ],
  ]; //2022 미술 표현 3~4년 내용체계
  List<List<String>> artTableExpreFiveSixValue = [
    [
      '표현 주제와 발상',
      '표현 재료와 용구, 디지털 매체',
      '조형 요소와 원리의 관계',
    ],
    [
      '다양한 방법으로 아이디어를 연결하기',
      '표현 방법을 탐색하여 활용하기',
      '과정을 돌아보며 작품을 발전시키기',
      '타 교과와 융합하기',
    ],
    ['주제 표현의 의지', '자유롭게 시도하는 태도']
  ]; //2022 미술 표현 5~6년 내용체계
//2022 미술 표현 내용체계표

  late List<List<String>> artTableAppreCategoryIndex = [
    artTableAppreKnowledgeLowerCategory,
    artTableAppreProcessLowerCategory,
    artTableAppreWorthLowerCategory
  ];

  late List<String> artTableAppreLowerCategory =
      artTableAppreKnowledgeLowerCategory +
          artTableAppreProcessLowerCategory +
          artTableAppreWorthLowerCategory;

  List<String> artTableAppreKnowledgeLowerCategory = [''];
  List<String> artTableAppreProcessLowerCategory = [''];
  List<String> artTableAppreWorthLowerCategory = [''];
  List<String> artTableAppreCI = [
    '감상은 다양한 삶과 문화가 반영된 미술과의 만남으로 자신과 공동체의 문화를 이해하게 한다.',
    '작품의 내용과 형식에 관한 맥락적 이해와 비평은 미적 판단 능력을 높인다.',
    '감상은 서로 다른 관점을 이해하여 삶에서 미술 문화의 다원적 가치를 존중하도록 한다.',
  ];
  List<List<String>> artTableAppreOneTwoValue = [
    [''],
  ]; //2022 미술 감상 1~2년 내용체계
  List<List<String>> artTableAppreThreeFourValue = [
    [
      '미술 작품과 미술가',
      '미술 작품의 특징',
      '미술 전시',
    ],
    [
      '자세히 보고 질문하기',
      '미술 작품에 관한 느낌과 생각을 설명하기',
      '미술 전시 및 행사에 참여하기',
    ],
    [
      '자신의 감상 관점 존중',
      '미술 문화에 관한 관심',
    ]
  ]; //2022 미술 감상 3~4년 내용체계
  List<List<String>> artTableAppreFiveSixValue = [
    [
      '미술 작품의 배경',
      '미술 작품의 내용과 형식',
      '공동체의 미술 문화',
    ],
    [
      '작품과 배경을 연결하기',
      '다양한 방법으로 분석하기',
      '미술 문화 활동을 경험하고 공유하기',
    ],
    [
      '서로 다른 관점의 존중',
      '공동체 문화에 참여',
    ],
  ]; //2022 미술 감상 5~6년 내용체계
//2022 미술 감상 내용체계표
}

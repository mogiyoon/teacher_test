import 'package:teacher_test/contents/contents.dart';

class PEAchieve22 {
  late List<List<String>> peAchieveIndex = [
    peAchieve12,
    peAchieve34,
    peAchieve56
  ];

  late List<String> peAchieve = peAchieve12 + peAchieve34 + peAchieve56;

  late List<String> peAchieve12 =
      peAchieveExer12 + peAchieveSport12 + peAchieveExpre12;
  late List<String> peAchieve34 =
      peAchieveExer34 + peAchieveSport34 + peAchieveExpre34;
  late List<String> peAchieve56 =
      peAchieveExer56 + peAchieveSport56 + peAchieveExpre56;

  List<String> peAchieveExer12 = [];
  List<String> peAchieveSport12 = [];
  List<String> peAchieveExpre12 = [];

  //2022 체육 1~2년 성취기준

  List<String> peAchieveExer34 = [
    '운동과 체력의 의미를 이해하고 관계를 파악한다.',
    '기본 체력운동의 방법과 절차를 익히며 자신의 수준에 맞는 운동을 시도한다.',
    '운동과 건강의 의미를 이해하고 관계를 파악한다.',
    '건강을 위한 바른 생활 습관을 이해하고 생활 속에서 규칙적으로 실천한다.',
    '자신의 신체적 특징을 긍정적으로 인식하고 운동 계획을 세워 안전하게 활동한다.',
    '운동과 건강한 생활 습관 형성에 관심을 갖고 적극적으로 실천한다.',
  ];
  List<String> peAchieveSport34 = [
    '스포츠의 의미와 유형을 파악한다.',
    '기본 움직임 기술의 의미와 종류를 이해하고 스포츠와의 관계를 파악한다.',
    '움직임 요소에 따른 기본 움직임 기술의 수행 방법을 파악하고 시도한다.',
    '기본 움직임 기술을 연결한 복합적인 움직임 기술을 파악하고 시도한다.',
    '기술형 스포츠에 적합한 기본 움직임 기술을 파악하고 시도한다.',
    '전략형 스포츠에 적합한 기본 움직임 기술을 파악하고 시도한다.',
    '생태형 스포츠에 적합한 기본 움직임 기술을 파악하고 시도한다.',
    '움직임 기술 수행에 자신감을 갖고 적극적으로 시도한다.',
    '게임 활동에 최선을 다하고 규칙을 지킨다.',
    '다양한 스포츠 환경에 개방적인 태도를 갖고 적극적이고 안전하게 스포츠 활동에 참여한다.',
  ];
  List<String> peAchieveExpre34 = [
    '표현 활동의 의미와 기본 움직임 기술과의 관계를 파악한다.',
    '움직임 요소에 따른 기본 움직임 기술의 표현 방법을 파악하고 시도한다.',
    '기본 움직임 기술을 활용하여 사물이나 자연을 모방하여 표현한다.',
    '기본 움직임 기술을 활용하여 느낌이나 생각을 표현한다.',
    '기본 움직임 기술을 리듬에 맞춰 표현한다.',
    '기본 움직임 기술을 도구를 활용하여 표현한다.',
    '움직임의 심미적 표현에 대한 호기심과 감수성을 나타낸다.',
  ];

  //2022 체육 3~4년 성취기준

  List<String> peAchieveExer56 = [
    '건강 체력과 운동 체력의 의미와 요소를 파악하고 다양한 운동 방법을 탐색한다.',
    '건강 체력과 운동 체력을 측정하고 자신의 체력 수준에 맞는 운동을 시도한다.',
    '성장 발달의 의미와 특성을 이해하고 운동과의 관계를 파악한다.',
    '운동 및 생활 속 위험 상황, 성장 발달을 저해하는 생활 방식의 문제점을 파악하고 예방 및 대처 방법을 익혀 안전하게 활동한다.',
    '체력 운동을 끈기 있게 규칙적으로 수행한다.',
    '성장과 발달 과정에서 나타나는 신체적, 정서적, 사회적 특성과 차이를 공감하고 위험 상황에 침착하게 대처한다.',
  ];
  List<String> peAchieveSport56 = [
    '기술형 스포츠의 의미와 유형을 파악한다.',
    '기술형 스포츠 유형별로 기본 움직임 기술을 응용한 기본 기능을 파악하고 수행한다.',
    '기술형 스포츠 유형별 활동 방법을 파악하고 기본 전략을 게임 활동에서 수행한다.',
    '전략형 스포츠의 의미와 유형을 파악한다.',
    '전략형 스포츠 유형별로 기본 움직임 기술을 응용한 기본 기능을 파악하고 수행한다.',
    '전략형 스포츠 유형별 활동 방법을 파악하고 기본 전략을 게임 활동에서 수행한다.',
    '생태형 스포츠의 의미와 유형을 파악한다.',
    '생태형 스포츠 유형별로 기본 움직임 기술을 응용한 기본 기능을 파악하고 수행한다.',
    '생태형 스포츠 유형별 활동 방법을 파악하고 기본 전략을 게임 활동에서 수행한다.',
    '스포츠 활동에 참여하며 목표를 달성하기 위한 의지를 실천하고 상대의 기술을 인정한다.',
    '스포츠 활동에 참여하며 팀원과 협력하고 구성원을 배려한다.',
    '스포츠 활동에 참여하며 환경을 아끼고 감사하는 태도를 실천한다.',
  ];
  List<String> peAchieveExpre56 = [
    '표현 활동의 의미와 유형을 파악한다.',
    '스포츠 표현에서 움직임 기술을 응용한 기본 동작을 파악하고 표현한다.',
    '스포츠 표현의 기본 동작을 다양하게 구성하여 발표하고 감상한다.',
    '전통 표현에서 움직임 기술을 응용한 기본 동작을 파악하고 표현한다.',
    '전통 표현의 기본 동작을 다양하게 구성하여 발표하고 감상한다.',
    '현대 표현에서 움직임 기술을 응용한 기본 동작을 파악하고 표현한다.',
    '현대 표현의 기본 동작을 다양하게 구성하여 발표하고 감상한다.',
    '다양한 표현 활동 유형을 수용하고, 움직임 표현의 아름다움을 추구한다.',
  ];
//2022 체육 5~6년 성취기준
}

class PETable22 {
  List<String> tableGrade = TableCategory22().tableGrade;
  List<String> tableCategory = TableCategory22().tableCategory;

  List<String> peTableArea = [
    '운동',
    '스포츠',
    '표현',
  ];

  late List<List<List<String>>> peTableAreaIndex = [
    peTableExerCategoryIndex,
    peTableSportCategoryIndex,
    peTableExpreCategoryIndex
  ];

  late List<List<String>> peTableCIIndex = [
    peTableExerCI,
    peTableSportCI,
    peTableExpreCI,
  ];

  late List<List<String>> peTableLowerCategoryIndex = [
    peTableExerLowerCategory,
    peTableSportLowerCategory,
    peTableExpreLowerCategory
  ];

  late List<List<List<List<String>>>> peTableGradeValueIndex = [
    peTableOneTwoValueIndex,
    peTableThreeFourValueIndex,
    peTableFiveSixValueIndex,
  ];

  late List<List<List<String>>> peTableOneTwoValueIndex = [
    peTableExerOneTwoValue,
    peTableSportOneTwoValue,
    peTableExpreOneTwoValue
  ];

  late List<List<List<String>>> peTableThreeFourValueIndex = [
    peTableExerThreeFourValue,
    peTableSportThreeFourValue,
    peTableExpreThreeFourValue
  ];

  late List<List<List<String>>> peTableFiveSixValueIndex = [
    peTableExerFiveSixValue,
    peTableSportFiveSixValue,
    peTableExpreFiveSixValue
  ];

  late List<List<String>> peTableExerCategoryIndex = [
    peTableExerKnowledgeLowerCategory,
    peTableExerProcessLowerCategory,
    peTableExerWorthLowerCategory
  ];

  late List<String> peTableExerLowerCategory =
      peTableExerKnowledgeLowerCategory +
          peTableExerProcessLowerCategory +
          peTableExerWorthLowerCategory;

  List<String> peTableExerKnowledgeLowerCategory = [''];
  List<String> peTableExerProcessLowerCategory = [''];
  List<String> peTableExerWorthLowerCategory = [''];
  List<String> peTableExerCI = [
    '운동은 체력과 건강을 관리하는 주요 방법으로, 생애 전반에 걸쳐 건강한 삶의 토대가 된다.',
    '체력은 건강의 기초가 되며, 건강은 신체적 특성에 맞는 운동과 생활 습관을 계획하고 관리함으로써 증진된다.',
    '인간은 생활 속에서 운동을 즐기고, 심신의 건강을 유지하며, 행복한 삶을 영위한다.',
  ];
  List<List<String>> peTableExerOneTwoValue = [
    [''],
    [''],
    [''],
  ]; //2022 체육 운동 1~2년 내용체계
  List<List<String>> peTableExerThreeFourValue = [
    [
      '운동과 체력',
      '기본 체력운동 방법',
      '운동과 건강',
      '건강한 생활 습관',
    ],
    [
      '운동과 체력의 관계 파악하기',
      '기본 체력 운동 시도하기',
      '운동과 건강의 관계 파악하기',
      '건강한 생활 습관 시도하기',
      '안전하게 활동하기',
    ],
    [
      '긍정적 신체 인식',
      '운동 및 건강에 관한 관심',
      '운동 및 건강 습관 실천 의지',
    ],
  ]; //2022 체육 운동 3~4년 내용체계
  List<List<String>> peTableExerFiveSixValue = [
    [
      '건강 체력과 운동 체력',
      '체력 종류별 운동 방법',
      '운동과 성장 발달',
      '안전한 생활 습관',
    ],
    [
      '건강 체력과 운동 체력의 의미와 요소 파악하기',
      '체력을 측정하고 다양한 운동 시도하기',
      '운동과 성장 발달의 관계 파악하기',
      '운동과 생활 속 안전사고 예방 방법 탐색하며 대처하기',
      '안전하게 활동하기',
    ],
    [
      '체력 운동 참여의 근면성',
      '체력 증진을 위한 끈기',
      '성장 발달의 차이 공감',
      '안전사고에서의 침착성',
    ],
  ]; //2022 체육 운동 5~6년 내용체계
//2022 체육 운동 내용체계표

  late List<List<String>> peTableSportCategoryIndex = [
    peTableSportKnowledgeLowerCategory,
    peTableSportProcessLowerCategory,
    peTableSportWorthLowerCategory
  ];

  late List<String> peTableSportLowerCategory =
      peTableSportKnowledgeLowerCategory +
          peTableSportProcessLowerCategory +
          peTableSportWorthLowerCategory;

  List<String> peTableSportKnowledgeLowerCategory = [''];
  List<String> peTableSportProcessLowerCategory = [''];
  List<String> peTableSportWorthLowerCategory = [''];
  List<String> peTableSportCI = [
    '스포츠는 인간이 제도화된 규범과 움직임 기술을 바탕으로 타인 및 주변 세계와 소통하며 바람직한 구성원으로 성장하는 데 이바지한다.',
    '스포츠는 인간이 환경과 상호작용하고 다양한 기술과 창의적인 전략을 발휘하며 한계를 극복하는 과정에서 발달한다.',
    '인간은 스포츠를 다양한 방식으로 체험함으로써 움직임의 즐거움을 느끼고 활동적인 삶의 태도를 배운다.',
  ];
  List<List<String>> peTableSportOneTwoValue = [
    [''],
    [''],
    [''],
  ]; //2022 체육 스포츠 1~2년 내용체계
  List<List<String>> peTableSportThreeFourValue = [
    [
      '스포츠와 움직임 기술',
      '기본 움직임 기술의 종류와 수행 방법',
      '스포츠에서의 기본 움직임 기술 수행 방법',
    ],
    [
      '스포츠의 의미와 유형 이해하기',
      '기본 움직임 기술과 스포츠의 관계 파악하기',
      '기본 움직임 기술의 종류 파악하고 시도하기',
      '스포츠 유형별 움직임 기술 종류 파악하기',
      '스포츠 유형별 움직임 기술 시도하기',
      '안전하게 움직이기',
    ],
    [
      '움직임 수행의 자신감과 적극성',
      '최선을 다하는 태도',
      '게임 규칙 준수',
      '스포츠 환경에 대한 개방성',
      '스포츠 활동 참여의 적극성',
    ],
  ]; //2022 체육 스포츠 3~4년 내용체계
  List<List<String>> peTableSportFiveSixValue = [
    [
      '기술형⋅전략형⋅생태형 스포츠의 유형',
      '기술형⋅전략형⋅생태형 스포츠의 유형별 움직임 기술 응용 방법',
      '기술형⋅전략형⋅생태형 스포츠의 활동 방법과 기본 전략',
    ],
    [
      '기술형⋅전략형⋅생태형 스포츠의 유형 파악하기',
      '기술형⋅전략형⋅생태형 스포츠의 유형별 움직임 기술 응용 방법 활용하기',
      '기술형⋅전략형⋅생태형 스포츠의 기본 전략 적용하기',
      '안전하게 활동하기',
    ],
    [
      '목표 달성 의지',
      '상대 기술 인정',
      '팀원과의 협력',
      '구성원 배려',
      '스포츠 환경을 아끼는 태도',
      '스포츠 환경에 감사하는 태도',
    ],
  ]; //2022 체육 스포츠 5~6년 내용체계
//2022 체육 스포츠 내용체계표

  late List<List<String>> peTableExpreCategoryIndex = [
    peTableExpreKnowledgeLowerCategory,
    peTableExpreProcessLowerCategory,
    peTableExpreWorthLowerCategory
  ];

  late List<String> peTableExpreLowerCategory =
      peTableExpreKnowledgeLowerCategory +
          peTableExpreProcessLowerCategory +
          peTableExpreWorthLowerCategory;

  List<String> peTableExpreKnowledgeLowerCategory = [''];
  List<String> peTableExpreProcessLowerCategory = [''];
  List<String> peTableExpreWorthLowerCategory = [''];
  List<String> peTableExpreCI = [
    '표현 활동은 인간이 신체 움직임에 생각과 감정을 담아 심미적으로 표현하는 과정에서 창의적인 삶의 태도를 형성하고, 예술적 신체활동 문화를 향유할 수 있도록 한다.',
    '표현 활동은 기본 움직임에 표현 원리가 적용되어 다양한 유형으로 구현되며, 구성 및 창작의 과정을 통해 발달한다.',
    '인간은 다양한 표현 활동을 체험함으로써 움직임의 심미적 가치를 내면화하며 자유롭고 주체적으로 사는 방법을 터득한다.',
  ];
  List<List<String>> peTableExpreOneTwoValue = [
    [''],
    [''],
    [''],
  ]; //2022 체육 표현 1~2년 내용체계
  List<List<String>> peTableExpreThreeFourValue = [
    [
      '표현 활동과 움직임 기술',
      '기본 움직임 기술의 표현 방법',
    ],
    [
      '표현 활동의 움직임 기술 파악하고 시도하기',
      '다양한 방법으로 움직임 기술 표현하기',
    ],
    [
      '움직임 표현에 대한 호기심',
      '움직임 표현에 대한 감수성',
    ],
  ]; //2022 체육 표현 3~4년 내용체계
  List<List<String>> peTableExpreFiveSixValue = [
    [
      '표현 활동의 유형',
      '표현 활동의 유형별 움직임 기술 응용 방법',
      '표현 활동의 유형별 움직임 기술 구성',
    ],
    [
      '표현 활동의 유형 파악하기',
      '표현 활동의 유형별 움직임 기술 응용 방법 활용하기',
      '표현 활동의 유형별 움직임 기술 구성하고 발표하기',
    ],
    [
      '다양한 표현 활동 유형에 대한 수용적 태도',
      '움직임 표현의 심미성 추구',
    ],
  ]; //2022 체육 표현 5~6년 내용체계
//2022 체육 표현 내용체계표
}

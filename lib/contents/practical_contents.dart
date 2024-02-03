import 'package:teacher_test/contents/contents.dart';

class PracticalAchieve22 {
  late List<List<String>> practicalAchieveIndex = [
    practicalAchieve12,
    practicalAchieve34,
    practicalAchieve56
  ];

  late List<String> practicalAchieve =
      practicalAchieve12 + practicalAchieve34 + practicalAchieve56;

  late List<String> practicalAchieve12 = practicalAchieveLife12 +
      practicalAchieveChoice12 +
      practicalAchieveRevolution12 +
      practicalAchieveConvergence12 +
      practicalAchieveAI12;
  late List<String> practicalAchieve34 = practicalAchieveLife34 +
      practicalAchieveChoice34 +
      practicalAchieveRevolution34 +
      practicalAchieveConvergence34 +
      practicalAchieveAI34;
  late List<String> practicalAchieve56 = practicalAchieveLife56 +
      practicalAchieveChoice56 +
      practicalAchieveRevolution56 +
      practicalAchieveConvergence56 +
      practicalAchieveAI56;

  List<String> practicalAchieveLife12 = [];
  List<String> practicalAchieveChoice12 = [];
  List<String> practicalAchieveRevolution12 = [];
  List<String> practicalAchieveConvergence12 = [];
  List<String> practicalAchieveAI12 = [];

  //2022 실과 1~2년 성취기준

  List<String> practicalAchieveLife34 = [];
  List<String> practicalAchieveChoice34 = [];
  List<String> practicalAchieveRevolution34 = [];
  List<String> practicalAchieveConvergence34 = [];
  List<String> practicalAchieveAI34 = [];

  //2022 실과 3~4년 성취기준

  List<String> practicalAchieveLife56 = [
    '아동기의 발달 특징을 이해하고 성장발달에 필요한 조건과 방법을 탐색한다.',
    '건강한 발달을 위한 자기 관리 방법을 탐색하고, 일상생활 속에서 올바른 생활습관과 태도를 갖도록 계획하여 실천한다.',
    '건강한 가정생활을 위해 가족원 모두에게 다양한 요구가 있음을 이해하여 서로에 대한 배려와 돌봄을 실천한다.',
    '균형 잡힌 식사의 중요성과 조건을 탐색하여 자신의 식습관을 검토해 보고 건강한 식습관 형성에 적용한다.',
    '옷의 기능을 이해하여 평소 자신의 옷차림을 살펴보고 건강하고 적절한 옷 입기를 실천한다.',
    '가정일을 수행하는 과정에서 일의 가치와 중요성을 이해하고, 가정생활을 유지하는 데 필요한 가정일의 종류를 탐색한다.',
    '직업의 필요성을 이해하고 적성, 흥미, 성격에 따라 진로 발달 계획을 세우고 주도적으로 탐색한다.'
  ];
  List<String> practicalAchieveChoice56 = [
    '시간이나 용돈과 같은 생활자원이 제한되어 있음을 이해하고, 생활자원의 사용가치를 높이는 방법을 탐색한다.',
    '생활자원 관리의 필요성을 인식하고, 생활자원의 합리적인 보관과 활용방법을 익힌다.',
    '생활자원의 올바른 사용이 가정과 환경에 도움이 됨을 이해하고 재활용, 재사용 등 환경을 고려한 관리 방법을 실천한다.',
    '식재료 생산과 선택의 중요성을 인식하고 여러 식재료의 고유하고 다양한 맛을 경험하여 자신의 식사에 적용한다.',
    '음식의 조리과정을 체험하여 자기 간식이나 식사를 스스로 마련하는 식생활을 실천한다.',
    '우리나라 밥상차림을 이해하고, 함께 식사하는 즐거움을 경험하면서 이 과정에서 식사 예절을 실천한다.',
    '의생활 용품이 만들어지는 과정을 탐색하여 옷이나 생활용품이 어떻게 구성되는지를 설명한다.',
    '다양한 도구와 재료를 활용하여 간단한 생활용품을 만들어 보면서 직접 만들어 쓰는 즐거움과 창의적 태도를 가진다.',
    '간단한 옷의 수선 등 의생활과 관련된 문제를 스스로 해결하려는 태도를 가진다.',
    '자신의 생활공간을 쾌적하고 위생적으로 관리하는 것의 중요성을 알고, 정리정돈과 청소 및 쓰레기 처리의 방법을 익혀 실천한다.',
    '생태 지향적 삶을 위해 자신의 의식주 생활에서 할 수 있는 구체적인 행동을 계획하여 실천한다.',
  ];
  List<String> practicalAchieveRevolution56 = [
    '발명의 의미를 이해하고, 일상생활을 바꾼 발명품을 탐색하여 발명과 기술에 대한 중요성과 가치를 인식한다.',
    '발명사고기법과 기술적 문제 해결 과정을 이해하고, 다양한 재료를 활용하여 생활 속 문제를 해결할 수 있는 창의적인 제품을 구상하고 만들어 봄으로써 실천적 태도를 갖는다.',
    '발명과 특허의 관계를 이해하고, 특허 침해 사례를 통하여 지식재산권의 중요성을 인식하여 올바른 방법으로 활용한다.',
    '수송의 의미와 수송 수단의 발달과정에 대한 이해를 바탕으로 생활 속 다양한 수송 수단을 탐색한다.',
    '수송 수단의 구성 요소를 이해하고, 친환경 에너지를 적용한 다양한 수송 수단의 시제품을 만들어 수송기술의 가치를 인식한다.',
  ];
  List<String> practicalAchieveConvergence56 = [
    '친환경 건설 구조물을 이해하고, 생활 속 건설 구조물을 탐색하여 간단한 구조물을 체험하면서 건설기술에 대한 가치를 인식한다.',
    '생활 속 디지털 기술의 중요성을 이해하고, 디지털 기기와 디지털 콘텐츠 저작 도구를 사용하여 발표 자료를 만들어 보면서 디지털 기기의 활용 능력을 기른다.',
    '제작한 발표 자료를 사이버 공간에 공유하고, 건전한 정보기기의 활용을 실천한다.',
    '로봇의 개념과 구조를 이해하고, 생활 속 로봇 기능을 체험하여 로봇의 중요성을 인식한다.',
    '로봇의 종류와 활용 사례를 통해 작동 원리를 이해하고, 로봇에 대한 관심과 흥미를 가진다.',
    '로봇의 융합 기술을 이해하고, 간단한 로봇을 만들어 코딩과 프로그램을 적용하여 동작시키는 체험을 통해 융합 기술의 가치를 인식한다.',
    '생활 속 동식물 자원을 활용 목적에 따라 분류하고 이와 관련된 다양한 생명기술을 탐색한다.',
    '생활 속 동식물을 기르고 가꾸는 방법을 알고, 동식물을 기르고 가꾸는 체험을 통해 생태 존중감을 가진다.',
    '동식물 자원의 친환경 농업 사례를 통해 지속가능한 농업이 순환되고 있음을 인식하고 농업의 미래가치를 인식한다.',
    '생활 속에서 농업활동과 관련된 모습을 분석하고 이에 따른 농업활동을 체험하여 농업에 대한 관심을 두고 이를 생활 속에서 실천한다.',
    '농업과 농촌의 다원적인 역할과 가치를 이해하고 미래 농업과 관련된 다양한 직업 세계를 탐색한다.',
  ];
  List<String> practicalAchieveAI56 = [
    '컴퓨터를 활용한 생활 속 문제해결 사례를 탐색하고 일상생활 속 문제를 해결하기 위한 알고리즘을 다양한 방법으로 표현한다.',
    '컴퓨터에게 명령하는 방법을 체험하고, 주어진 문제를 해결하는 프로그램을 작성한다.',
    '실생활의 문제를 해결하는 프로그램을 협력하여 작성하고, 산출물을 타인과 공유한다.',
    '디지털 데이터와 아날로그 데이터의 특징을 이해하고, 인공지능에 활용할 수 있는 데이터의 유형이나 형태를 탐색한다.',
    '인공지능이 만들어지는 과정을 체험하고, 인공지능이 사회에 미치는 영향을 탐색한다.',
  ];
//2022 실과 5~6년 성취기준
}

class PracticalTable22 {
  List<String> tableGrade = TableCategory22().tableGrade;
  List<String> tableCategory = TableCategory22().tableCategory;

  List<String> practicalTableArea = [
    '인간 발달과 주도적 삶',
    '생활환경과 지속가능한 선택',
    '기술적 문제해결과 혁신',
    '지속가능한 기술과 융합',
    '디지털 사회와 인공지능',
  ];

  late List<List<List<String>>> practicalTableAreaIndex = [
    practicalTableLifeCategoryIndex,
    practicalTableChoiceCategoryIndex,
    practicalTableRevolutionCategoryIndex,
    practicalTableConvergenceCategoryIndex,
    practicalTableAICategoryIndex,
  ];

  late List<List<String>> practicalTableCIIndex = [
    practicalTableLifeCI,
    practicalTableChoiceCI,
    practicalTableRevolutionCI,
    practicalTableConvergenceCI,
    practicalTableAICI,
  ];

  late List<List<String>> practicalTableLowerCategoryIndex = [
    practicalTableLifeLowerCategory,
    practicalTableChoiceLowerCategory,
    practicalTableRevolutionLowerCategory,
    practicalTableConvergenceLowerCategory,
    practicalTableAILowerCategory,
  ];

  late List<List<List<List<String>>>> practicalTableGradeValueIndex = [
    practicalTableOneTwoValueIndex,
    practicalTableThreeFourValueIndex,
    practicalTableFiveSixValueIndex,
  ];

  late List<List<List<String>>> practicalTableOneTwoValueIndex = [
    practicalTableLifeOneTwoValue,
    practicalTableChoiceOneTwoValue,
    practicalTableRevolutionOneTwoValue,
    practicalTableConvergenceOneTwoValue,
    practicalTableAIOneTwoValue,
  ];

  late List<List<List<String>>> practicalTableThreeFourValueIndex = [
    practicalTableLifeThreeFourValue,
    practicalTableChoiceThreeFourValue,
    practicalTableRevolutionThreeFourValue,
    practicalTableConvergenceThreeFourValue,
    practicalTableAIThreeFourValue,
  ];

  late List<List<List<String>>> practicalTableFiveSixValueIndex = [
    practicalTableLifeFiveSixValue,
    practicalTableChoiceFiveSixValue,
    practicalTableRevolutionFiveSixValue,
    practicalTableConvergenceFiveSixValue,
    practicalTableAIFiveSixValue,
  ];

  late List<List<String>> practicalTableLifeCategoryIndex = [
    practicalTableLifeKnowledgeLowerCategory,
    practicalTableLifeProcessLowerCategory,
    practicalTableLifeWorthLowerCategory
  ];

  late List<String> practicalTableLifeLowerCategory =
      practicalTableLifeKnowledgeLowerCategory +
          practicalTableLifeProcessLowerCategory +
          practicalTableLifeWorthLowerCategory;

  List<String> practicalTableLifeKnowledgeLowerCategory = [''];
  List<String> practicalTableLifeProcessLowerCategory = [''];
  List<String> practicalTableLifeWorthLowerCategory = [''];
  List<String> practicalTableLifeCI = [
    '인간 발달에 대한 이해는 자립적인 삶을 이끌고 타인과의 건강한 관계를 형성하는 기초가 된다.',
    '일상에서 직면하는 문제에 대처할 수 있는 역량은 개인 및 가족의 긍정적 발달과 행복한 일상의 삶을 주도적으로 이끌 수 있게 한다.',
    '일상에서 직면하는 상호 존중과 협력적 소통에 기반한 관계맺음의 경험은 건강한 대인 관계를 확장하는 밑거름이 된다.',
    '가정일과 생활 습관은 변화하는 일상에서 개인 및 가족의 요구와 문제를 해결해 나갈 수 있게 하면서 생활방식과 진로를 스스로 개척하고 성장하기 위한 바탕이 된다.',
  ];
  List<List<String>> practicalTableLifeOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 인간 발달과 주도적 삶 1~2년 내용체계
  List<List<String>> practicalTableLifeThreeFourValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 인간 발달과 주도적 삶 3~4년 내용체계
  List<List<String>> practicalTableLifeFiveSixValue = [
    [
      '아동기 발달과 자기이해',
      '자립적 일상생활',
      '균형 잡힌 식사',
      '옷의 기능과 옷차림',
      '가정생활과 가정일',
      '진로 발달과 직업',
    ],
    [
      '건강한 발달을 위한 자기 관리 방법 탐색하기',
      '자립적 일상생활에 필요한 조건 살펴보기',
      '가족원의 다양한 요구 파악하기',
      '바람직한 식습관 형성하기',
      '건강하고 적절한 옷차림 파악하기',
      '가정생활을 유지하는 가정일의 종류 살펴보기',
      '가정일 수행에 참여하기',
    ],
    [
      '아동기 발달에 대한 긍정적인 수용',
      '일상생활 속 올바른 생활습관과 예절을 실천하는 태도',
      '가족 간 배려와 돌봄의 가치',
      '협력적 소통에 기반한 역할 분담의 가치 수용',
      '일과 노동의 가치',
      '진로를 주도적으로 탐색하는 태도',
    ],
  ]; //2022 실과 인간 발달과 주도적 삶 5~6년 내용체계
//2022 실과 인간 발달과 주도적 삶 내용체계표

  late List<List<String>> practicalTableChoiceCategoryIndex = [
    practicalTableChoiceKnowledgeLowerCategory,
    practicalTableChoiceProcessLowerCategory,
    practicalTableChoiceWorthLowerCategory
  ];

  late List<String> practicalTableChoiceLowerCategory =
      practicalTableChoiceKnowledgeLowerCategory +
          practicalTableChoiceProcessLowerCategory +
          practicalTableChoiceWorthLowerCategory;

  List<String> practicalTableChoiceKnowledgeLowerCategory = [''];
  List<String> practicalTableChoiceProcessLowerCategory = [''];
  List<String> practicalTableChoiceWorthLowerCategory = [''];
  List<String> practicalTableChoiceCI = [
    '삶의 욕구와 문제를 해결하는 과정에서 인간이 경험하는 생활자원의 제한성은 개인과 가족의 관리능력을 요구한다.',
    '생활의 기본 조건으로서 의식주 생활의 수행능력을 갖추는 일은 창의적이고 가치 있는 삶을 설계하고 영위할 수 있는 기초가 된다.',
    '변화하는 생활환경을 안전하고 건강하게 유지하고자 하는 개인과 가족의 책임 있는 행동을 통해 소비자 시민성을 함양할 수 있다.',
    '일상생활에서 지속가능한 선택을 지향하는 것은 현재 생활공동체와의 공존과 함께 미래 세대의 건강한 삶을 위한 책임 있는 행동이다.',
  ];
  List<List<String>> practicalTableChoiceOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 생활환경과 지속가능한 선택 1~2년 내용체계
  List<List<String>> practicalTableChoiceThreeFourValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 생활환경과 지속가능한 선택 3~4년 내용체계
  List<List<String>> practicalTableChoiceFiveSixValue = [
    [
      '생활자원의 특징',
      '생활자원의 보관과 활용',
      '식재료의 생산과 선택',
      '음식의 마련과 섭취',
      '옷이나 생활용품의 구성',
      '생활공간과 정리정돈',
      '지속가능한 의식주생활',
    ],
    [
      '생활자원의 사용가치를 높이는 방법 탐색하기',
      '합리적인 관리 방법 실천하기',
      '자신의 선택이 공동체의 삶과 환경에 미치는 영향 설명하기',
      '음식을 마련하는 과정 체험하기',
      '생활용품을 만드는 과정 경험하기',
      '생활 속 의생활 문제 해결하기',
      '생활공간을 청결하게 하는 과정 경험하기',
      '일상생활에서의 지속가능한 행동을 계획하여 실천하기',
    ],
    [
      '생활자원을 소중하게 여기는 태도',
      '함께하는 식사의 즐거움',
      '식사 예절을 실천하는 태도',
      '직접 만들어 쓰기의 가치와 창의적 태도',
      '제작 과정에서 절차적 사고를 중시하는 태도',
      '안전한 생활을 실천하는 태도',
      '쾌적한 생활공간 유지를 위한 노력',
      '나눔의 봉사활동과 기부문화의 존중',
    ]
  ]; //2022 실과 생활환경과 지속가능한 선택 5~6년 내용체계
//2022 실과 생활환경과 지속가능한 선택 내용체계표

  late List<List<String>> practicalTableRevolutionCategoryIndex = [
    practicalTableRevolutionKnowledgeLowerCategory,
    practicalTableRevolutionProcessLowerCategory,
    practicalTableRevolutionWorthLowerCategory
  ];

  late List<String> practicalTableRevolutionLowerCategory =
      practicalTableRevolutionKnowledgeLowerCategory +
          practicalTableRevolutionProcessLowerCategory +
          practicalTableRevolutionWorthLowerCategory;

  List<String> practicalTableRevolutionKnowledgeLowerCategory = [''];
  List<String> practicalTableRevolutionProcessLowerCategory = [''];
  List<String> practicalTableRevolutionWorthLowerCategory = [''];
  List<String> practicalTableRevolutionCI = [
    '기술은 인간의 필요와 욕구를 충족하기 위한 혁신적인 문제 해결 활동으로 인류 문명을 주도하고 사회⋅문화⋅경제 등에 바람직한 영향을 끼치도록 활용되어야 한다.',
    '인간은 기술적 문제 해결 과정을 통해 발명 문제를 창의적으로 해결하며, 지식재산에 대한 보호 및 발명과 혁신은 기술의 가치를 높인다.',
    '창의적인 제품의 개발은 기술적 문제 해결 과정을 통해 이루어지며, 제품을 생산하기 위해서는 설계 활동 및 다양한 재료와 도구의 활용이 필요하다.',
    '친환경 에너지를 활용한 수송 수단은 자원의 고갈과 환경 문제를 극복하는 대안이며, 혁신적 수송 수단과 물류 체제 구축은 제품의 효율적인 수송을 가능하게 한다.',
  ];
  List<List<String>> practicalTableRevolutionOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 기술적 문제해결과 혁신 1~2년 내용체계
  List<List<String>> practicalTableRevolutionThreeFourValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 기술적 문제해결과 혁신 3~4년 내용체계
  List<List<String>> practicalTableRevolutionFiveSixValue = [
    [
      '발명의 의미와 발명품',
      '기술적 문제 해결과 발명사고기법',
      '발명과 특허의 개념',
      '지식재산권의 중요성',
      '수송의 의미와 수송 수단의 발달',
      '수송 수단의 구성 요소',
    ],
    [
      '생활 속 기술적 문제 확인하기',
      '창의적인 제품 구상하기',
      '발명 제품의 설계와 제작하기',
      '발명품의 특허 정보 검색하기',
      '다양한 수송 수단 탐색하기',
      '친환경 수송 수단의 설계와 제작하기',
    ],
    [
      '발명과 기술에 대한 관심과 흥미',
      '기술에 대한 가치 인식',
      '발명 아이디어 발상의 실천적 태도',
      '지식재산보호에 대한 인식',
      '미래 수송 수단에 대한 관심',
    ],
  ]; //2022 실과 기술적 문제해결과 혁신 5~6년 내용체계
//2022 실과 기술적 문제해결과 혁신 내용체계표

  late List<List<String>> practicalTableConvergenceCategoryIndex = [
    practicalTableConvergenceKnowledgeLowerCategory,
    practicalTableConvergenceProcessLowerCategory,
    practicalTableConvergenceWorthLowerCategory
  ];

  late List<String> practicalTableConvergenceLowerCategory =
      practicalTableConvergenceKnowledgeLowerCategory +
          practicalTableConvergenceProcessLowerCategory +
          practicalTableConvergenceWorthLowerCategory;

  List<String> practicalTableConvergenceKnowledgeLowerCategory = [''];
  List<String> practicalTableConvergenceProcessLowerCategory = [''];
  List<String> practicalTableConvergenceWorthLowerCategory = [''];
  List<String> practicalTableConvergenceCI = [
    '건설기술은 쾌적하고 편리하며 안전한 생활을 위한 다양한 설계와 시공 및 유지관리 방법을 적용하고 있으며, 다른 산업의 수행을 위한 기반 요소로서 가치를 가진다.',
    '로봇은 기계요소, 전기전자 등의 하드웨어와 이를 제어하는 소프트웨어로 구성되며, 여러 가지 기술과 지식이 적용된 첨단 융합기술의 산물로서 사회 각 분야에 활용된다.',
    '정보통신 기술의 발달은 시공간 극복을 통해 정보와 문화의 교류 및 세계화에 기여해왔으며, 다양한 기술과 융합하여 인간을 새로운 영역으로 이끈다.',
    '생명기술은 다양한 기술과 융합하여 발달하고 있으며, 식량자원의 활용과 농업의 순환체험은 지속가능한 미래생활을 위한 기초가 된다.',
  ];
  List<List<String>> practicalTableConvergenceOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 지속가능한 기술과 융합 1~2년 내용체계
  List<List<String>> practicalTableConvergenceThreeFourValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 지속가능한 기술과 융합 3~4년 내용체계
  List<List<String>> practicalTableConvergenceFiveSixValue = [
    [
      '건설기술의 개념과 친환경 구조물',
      '디지털 기술의 특징과 디지털 콘텐츠의 종류',
      '로봇의 개념과 작동 원리',
      '로봇 융합기술의 이해',
      '생활 속 동식물의 이해',
      '동식물 자원의 분류',
      '동식물 자원의 친환경 농업',
      '미래생활과 연관된 농업활동',
      '농업과 농촌의 다원적인 역할',
    ],
    [
      '생활 속 건설 구조물 탐색과 체험하기',
      '디지털 콘텐츠의 제작과 공유하기',
      '간단한 로봇의 조립과 작동시키기',
      '로봇의 동작에 코딩 프로그램 적용하기',
      '융합적 사고하기',
      '동식물과 관련된 생명기술 탐색하기',
      '동식물을 기르고 가꾸기',
      '생활 속 농업활동 체험하기',
    ],
    [
      '건설기술에 대한 가치 인식',
      '로봇에 대한 관심과 흥미',
      '건전한 사이버 공간의 활용 태도',
      '동식물에 대한 생태존중감을 갖는 태도',
      '지속가능한 농업의 순환성과 중요성 인식',
      '농업에 대한 관심과 흥미',
      '농산업에 대한 올바른 진로관을 갖는 태도',
    ],
  ]; //2022 실과 지속가능한 기술과 융합 5~6년 내용체계
//2022 실과 지속가능한 기술과 융합 내용체계표

  late List<List<String>> practicalTableAICategoryIndex = [
    practicalTableAIKnowledgeLowerCategory,
    practicalTableAIProcessLowerCategory,
    practicalTableAIWorthLowerCategory
  ];

  late List<String> practicalTableAILowerCategory =
      practicalTableAIKnowledgeLowerCategory +
          practicalTableAIProcessLowerCategory +
          practicalTableAIWorthLowerCategory;

  List<String> practicalTableAIKnowledgeLowerCategory = [''];
  List<String> practicalTableAIProcessLowerCategory = [''];
  List<String> practicalTableAIWorthLowerCategory = [''];
  List<String> practicalTableAICI = [
    '프로그래밍은 디지털 사회에서 발생하는 다양한 문제를 해결하는 데 도움을 준다.',
    '컴퓨터로 처리할 수 있는 데이터는 디지털 데이터이며, 문제 해결을 위한 명령은 명확한 절차가 필요하다.',
    '인공지능은 인간의 지능을 모방하여 만든 프로그램 시스템으로 생활 속의 다양한 분야에 영향을 미친다.',
  ];
  List<List<String>> practicalTableAIOneTwoValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 디지털 사회와 인공지능 1~2년 내용체계
  List<List<String>> practicalTableAIThreeFourValue = [
    [''],
    [''],
    ['']
  ]; //2022 실과 디지털 사회와 인공지능 3~4년 내용체계
  List<List<String>> practicalTableAIFiveSixValue = [
    [
      '컴퓨터의 개념',
      '문제 찾기와 문제 해결 절차',
      '컴퓨터에게 명령하는 방법',
      '데이터의 종류와 표현',
      '생활 속 인공지능',
    ],
    [
      '생활 속에서 활용되는 컴퓨터의 사례 탐색하기',
      '일상생활의 문제를 해결하기 위한 알고리즘 구상하기',
      '문제를 해결하는 기초적인 프로그래밍하기',
      '데이터 간에 공통되는 유형이나 형태 탐색하기',
      '인공지능이 만들어지는 과정 탐색하기',
    ],
    [
      '생활 속에서 컴퓨터를 활용해 해결 가능한 문제를 탐색해 보려는 자세',
      '프로그래밍을 통해 만든 산출물을 타인과 공유하고 협력하려는 자세',
      '생활 속의 여러 가지 데이터가 갖는 의미를 파악하는 자세',
      '인공지능이 사회에 미치는 영향을 파악하는 자세',
    ]
  ]; //2022 실과 디지털 사회와 인공지능 5~6년 내용체계
//2022 실과 디지털 사회와 인공지능 내용체계표
}

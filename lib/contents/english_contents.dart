import 'package:teacher_test/contents/contents.dart';

class EnglishAchieve22 {
  late List<List<String>> englishAchieveIndex = [
    englishAchieve12,
    englishAchieve34,
    englishAchieve56
  ];

  late List<String> englishAchieve =
      englishAchieve12 + englishAchieve34 + englishAchieve56;

  late List<String> englishAchieve12 =
      englishAchieveUnder12 + englishAchieveExpre12;

  late List<String> englishAchieve34 =
      englishAchieveUnder34 + englishAchieveExpre34;

  late List<String> englishAchieve56 =
      englishAchieveUnder56 + englishAchieveExpre56;

  List<String> englishAchieveUnder12 = [];
  List<String> englishAchieveExpre12 = [];

  //2022 영어 1~2년 성취기준

  List<String> englishAchieveUnder34 = [
    '알파벳과 쉽고 간단한 단어의 소리를 듣고 식별한다.',
    '알파벳 대소문자를 식별하여 읽는다.',
    '쉽고 간단한 단어, 어구, 문장을 듣고 강세, 리듬, 억양을 식별한다.',
    '소리와 철자의 관계를 이해하며 쉽고 간단한 단어, 어구, 문장을 소리 내어 읽는다.',
    '쉽고 간단한 단어, 어구, 문장의 의미를 이해한다.',
    '자기 주변 주제에 관한 담화의 주요 정보를 파악한다.',
    '적절한 전략을 활용하여 담화나 문장을 듣거나 읽는다.',
    '다양한 매체로 표현된 담화나 문장을 흥미를 가지고 듣거나 읽는다.',
    '시, 노래, 이야기를 공감하며 듣는다.',
    '자기 주변 주제나 문화에 관한 담화나 문장을 존중의 태도로 듣거나 읽는다.'
  ];
  List<String> englishAchieveExpre34 = [
    '쉽고 간단한 단어, 어구, 문장을 강세, 리듬, 억양에 맞게 따라 말한다.',
    '알파벳 대소문자를 구별하여 쓴다.',
    '소리와 철자의 관계를 바탕으로 쉽고 간단한 단어를 쓴다.',
    '실물, 그림, 동작 등을 보고 쉽고 간단한 문장으로 말하거나 단어나 어구를 쓴다.',
    '자신, 주변 사람이나 사물의 소개나 묘사를 쉽고 간단한 문장으로 말하거나 보고 쓴다.',
    '행동 지시를 쉽고 간단한 문장으로 말하거나 보고 쓴다.',
    '자신의 감정을 쉽고 간단한 문장으로 말하거나 보고 쓴다.',
    '자기 주변 주제에 관한 담화의 주요 정보를 묻거나 답한다.',
    '적절한 매체나 전략을 활용하여 창의적으로 의미를 표현한다.',
    '의사소통 활동에 흥미와 자신감을 가지고 대화 예절을 지키며 참여한다.'
  ];

  //2022 영어 3~4년 성취기준

  List<String> englishAchieveUnder56 = [
    '간단한 단어, 어구, 문장을 듣고 강세, 리듬, 억양을 식별한다.',
    '간단한 단어, 어구, 문장을 강세, 리듬, 억양에 맞게 소리 내어 읽는다.',
    '간단한 단어, 어구, 문장의 의미를 이해한다.',
    '일상생활 주제에 관한 담화나 글의 세부 정보를 파악한다.',
    '일상생활 주제에 관한 담화나 글의 중심 내용을 파악한다.',
    '일상생활 주제에 관한 담화나 글에서 일이나 사건의 순서를 파악한다.',
    '적절한 전략을 활용하여 일상생활 주제에 관한 담화나 글을 듣거나 읽는다.',
    '다양한 매체로 표현된 담화나 글을 흥미와 자신감을 가지고 듣거나 읽는다.',
    '시, 노래, 이야기를 공감하며 듣거나 읽는다.',
    '일상생활 주제나 문화에 관한 담화나 글을 포용의 태도로 듣거나 읽는다.',
  ];
  List<String> englishAchieveExpre56 = [
    '간단한 단어, 어구, 문장을 강세, 리듬, 억양에 맞게 말한다.',
    '실물, 그림, 동작 등을 보고 간단한 단어, 어구, 문장으로 말하거나 쓴다.',
    '알파벳 대소문자와 문장 부호를 문장에서 바르게 사용한다.',
    '주변 사람이나 사물을 간단한 문장으로 소개하거나 묘사한다.',
    '주변 장소나 위치, 행동 순서나 방법을 간단한 문장으로 설명한다.',
    '자신의 감정이나 의견, 경험이나 계획을 간단한 문장으로 표현한다.',
    '일상생활 주제에 관한 담화나 글의 세부 정보를 간단한 문장으로 묻거나 답한다.',
    '예시문을 참고하여 목적에 맞는 간단한 글을 쓴다.',
    '적절한 매체와 전략을 활용하여 창의적으로 의미를 생성하고 표현한다.',
    '의사소통 활동에 흥미와 자신감을 가지고 참여하여 협력적으로 수행한다.'
  ];
//2022 영어 5~6년 성취기준
}

class EnglishTable22 {
  List<String> tableGrade = TableCategory22().tableGrade;
  List<String> tableCategory = TableCategory22().tableCategory;

  List<String> englishTableArea = [
    '이해(reception)',
    '표현(production)',
  ];

  late List<List<List<String>>> englishTableAreaIndex = [
    englishTableReceptionCategoryIndex,
    englishTableProductionCategoryIndex,
  ];

  late List<List<String>> englishTableCIIndex = [
    englishTableReceptionCI,
    englishTableProductionCI,
  ];

  late List<List<String>> englishTableLowerCategoryIndex = [
    englishTableReceptionLowerCategory,
    englishTableProductionLowerCategory,
  ];

  late List<List<List<List<String>>>> englishTableGradeValueIndex = [
    englishTableOneTwoValueIndex,
    englishTableThreeFourValueIndex,
    englishTableFiveSixValueIndex,
  ];

  late List<List<List<String>>> englishTableOneTwoValueIndex = [
    englishTableReceptionOneTwoValue,
    englishTableProductionOneTwoValue,
  ];

  late List<List<List<String>>> englishTableThreeFourValueIndex = [
    englishTableReceptionThreeFourValue,
    englishTableProductionThreeFourValue,
  ];

  late List<List<List<String>>> englishTableFiveSixValueIndex = [
    englishTableReceptionFiveSixValue,
    englishTableProductionFiveSixValue,
  ];

  late List<List<String>> englishTableReceptionCategoryIndex = [
    englishTableReceptionKnowledgeLowerCategory,
    englishTableReceptionProcessLowerCategory,
    englishTableReceptionWorthLowerCategory
  ];

  late List<String> englishTableReceptionLowerCategory =
      englishTableReceptionKnowledgeLowerCategory +
          englishTableReceptionProcessLowerCategory +
          englishTableReceptionWorthLowerCategory;

  List<String> englishTableReceptionKnowledgeLowerCategory = ['언어', '맥락'];
  List<String> englishTableReceptionProcessLowerCategory = [''];
  List<String> englishTableReceptionWorthLowerCategory = [''];
  List<String> englishTableReceptionCI = [
    '의사소통 목적과 상황에 맞게 배경지식을 활용하고 관점, 목적과 맥락을 파악함으로써 담화나 글을 이해하는 능력을 함양한다.',
    '적절한 사고 과정 및 전략을 활용하여 담화나 글의 의미를 파악하고 분석한다.',
    '담화나 글을 이해하는 활동은 협력적이고 포용적으로 화자나 필자의 의도를 이해하는 태도를 길러 준다.',
  ];
  List<List<String>> englishTableReceptionOneTwoValue = [
    [''],
    [''],
    [''],
    [''],
  ]; //2022 영어 이해 1~2년 내용체계
  List<List<String>> englishTableReceptionThreeFourValue = [
    [
      '쉽고 간단한 단어, 어구, 문장의 소리, 철자, 강세, 리듬, 억양',
      '의사소통 기능과 예시문',
      '기본 어휘 관련 지침에 따른 학습 어휘 수 300단어 이내',
      '초등학교 권장 언어 형식',
      '이야기나 서사 및 운문(동화, 그림책, 만화, 노래, 시 등)',
      '친교나 사회적 목적의 담화와 글(대화, 편지, 이메일 등)',
      '정보 전달⋅교환 목적의 담화와 글(표지판, 메모, 묘사, 안내 등)',
    ],
    [
      '소재',
      '자기 주변 주제',
      '간단한 의사소통 상황 및 목적',
      '다양한 문화권에 속한 사람들의 비언어적 의사소통 방식',
    ],
    [
      '소리 식별하기',
      '알파벳 대소문자 식별하기',
      '강세, 리듬, 억양 식별하기',
      '소리와 철자 관계 이해하며 소리 내어 읽기',
      '의미 이해하기',
      '주요 정보 파악하기',
      '시각 단서 활용하여 의미 추측하기',
      '다양한 매체로 표현된 담화나 문장을 듣거나 읽기',
    ],
    [
      '흥미와 자신감을 가지고 듣거나 읽으며 즐기는 태도',
      '상대의 감정을 느끼고 공감하는 태도',
      '다양한 문화와 의견을 존중하고 포용하는 태도',
    ],
  ]; //2022 영어 이해 3~4년 내용체계
  List<List<String>> englishTableReceptionFiveSixValue = [
    [
      '간단한 단어, 어구, 문장의 강세, 리듬, 억양',
      '의사소통 기능과 예시문',
      '기본 어휘 관련 지침에 따른 학습 어휘 수 300단어 이내',
      '초등학교 권장 언어 형식',
      '이야기나 서사 및 운문(동화, 그림책, 만화, 노래, 시, 일기 등)',
      '친교나 사회적 목적의 담화와 글(대화, 편지, 초대장, 이메일 등)',
      '정보 전달⋅교환 목적의 담화와 글(공지, 안내, 묘사, 설명, 광고 등)',
      '의견 전달⋅교환이나 주장 목적의 담화와 글(포스터, 감상문 등)',
    ],
    [
      '소재',
      '일상생활 주제',
      '일상적인 의사소통 상황 및 목적',
      '다양한 문화권에 속한 사람들의 언어적⋅비언어적 의사소통 방식',
    ],
    [
      '강세, 리듬, 억양 식별하기',
      '강세, 리듬, 억양에 맞게 소리 내어 읽기',
      '의미 이해하기',
      '세부 정보 파악하기',
      '중심 내용 파악하기',
      '일이나 사건의 순서 파악하기',
      '시각 단서 활용하여 듣거나 읽을 내용 예측하기',
      '특정 정보를 찾아 듣거나 읽기',
      '내용 확인하며 다시 듣거나 읽기',
      '다양한 매체로 표현된 담화나 글을 듣거나 읽기',
    ],
    [
      '흥미와 자신감을 가지고 듣거나 읽으며 즐기는 태도',
      '상대의 감정을 느끼고 공감하는 태도',
      '다양한 문화와 의견을 존중하고 포용하는 태도',
    ],
  ]; //2022 영어 이해 5~6년 내용체계
//2022 영어 이해 내용체계표

  late List<List<String>> englishTableProductionCategoryIndex = [
    englishTableProductionKnowledgeLowerCategory,
    englishTableProductionProcessLowerCategory,
    englishTableProductionWorthLowerCategory
  ];

  late List<String> englishTableProductionLowerCategory =
      englishTableProductionKnowledgeLowerCategory +
          englishTableProductionProcessLowerCategory +
          englishTableProductionWorthLowerCategory;

  List<String> englishTableProductionKnowledgeLowerCategory = ['언어', '맥락'];
  List<String> englishTableProductionProcessLowerCategory = [''];
  List<String> englishTableProductionWorthLowerCategory = [''];
  List<String> englishTableProductionCI = [
    '의사소통 목적과 상황에 맞게 적절한 매체를 활용하여 자신의 감정이나 의견을 담화나 글로 표현하는 능력을 함양한다.',
    '적절한 사고 과정 및 전략을 활용하여 의미를 표현하거나 교환한다.',
    '담화나 글로 표현하는 활동은 다양한 문화와 관점에 대한 이해를 바탕으로 협력적이고 포용적으로 상호 소통하며 의미를 표현하거나 교환하는 태도를 길러 준다.',
  ];
  List<List<String>> englishTableProductionOneTwoValue = [
    [''],
    [''],
    [''],
    [''],
  ]; //2022 영어 표현 1~2년 내용체계
  List<List<String>> englishTableProductionThreeFourValue = [
    [
      '쉽고 간단한 단어, 어구, 문장의 소리, 철자, 강세, 리듬, 억양',
      '의사소통 기능과 예시문',
      '기본 어휘 관련 지침에 따른 학습 어휘 수 300단어 이내',
      '초등학교 권장 언어 형식',
      '이야기나 서사 및 운문(동화, 그림책, 만화, 노래, 시 등)',
      '친교나 사회적 목적의 담화와 글(대화, 편지, 이메일 등)',
      '정보 전달⋅교환 목적의 담화와 글(표지판, 메모, 묘사, 안내 등)',
    ],
    [
      '소재',
      '자기 주변 주제',
      '간단한 의사소통 상황 및 목적',
      '다양한 문화권에 속한 사람들의 비언어적 의사소통 방식',
    ],
    [
      '강세, 리듬, 억양에 맞게 따라 말하기',
      '알파벳 대소문자 쓰기',
      '소리와 철자 관계 바탕으로 단어 쓰기',
      '실물, 그림, 동작 등을 보고 말하거나 쓰기',
      '인사 나누기',
      '자기 소개하기',
      '주변 사람이나 사물 묘사하기',
      '행동 지시하기',
      '감정 표현하기',
      '주요 정보 묻거나 답하기',
      '표정, 몸짓, 동작 수반하여 창의적으로 표현하기',
      '적절한 매체 활용하여 창의적으로 표현하기',
      '철자 점검하며 다시 쓰기',
    ],
    [
      '말하기와 쓰기에 대한 흥미와 자신감',
      '대화 예절을 지키고 협력하며 의사소통 활동에 참여하는 태도',
    ]
  ]; //2022 영어 표현 3~4년 내용체계
  List<List<String>> englishTableProductionFiveSixValue = [
    [
      '간단한 단어, 어구, 문장의 강세, 리듬, 억양',
      '의사소통 기능과 예시문',
      '기본 어휘 관련 지침에 따른 학습 어휘 수 300단어 이내',
      '초등학교 권장 언어 형식',
      '이야기나 서사 및 운문(동화, 그림책, 만화, 노래, 시, 일기 등)',
      '친교나 사회적 목적의 담화와 글(대화, 편지, 초대장, 이메일 등)',
      '정보 전달⋅교환 목적의 담화와 글(공지, 안내, 묘사, 설명, 광고 등)',
      '의견 전달⋅교환이나 주장 목적의 담화와 글(포스터, 감상문 등)',
    ],
    [
      '소재',
      '일상생활 주제',
      '일상적인 의사소통 상황 및 목적',
      '다양한 문화권에 속한 사람들의 언어적⋅비언어적 의사소통 방식',
    ],
    [
      '강세, 리듬, 억양에 맞게 말하기',
      '실물, 그림, 동작 등을 보고 말하거나 쓰기',
      '알파벳 대소문자와 문장 부호 바르게 사용하기',
      '주변 사람 소개하기',
      '주변 사람이나 사물 묘사하기',
      '주변 장소나 위치, 행동 순서나 방법 설명하기',
      '감정이나 의견, 경험이나 계획 기술하기',
      '세부 정보 묻거나 답하기',
      '예시문 참고하여 목적에 맞는 글쓰기',
      '반복, 확인 등을 통해 대화 지속하기',
      '브레인스토밍으로 아이디어 생성하기',
      '다양한 매체 활용하여 창의적으로 표현하기',
      '피드백 반영해 고쳐 쓰기',
    ],
    [
      '말하기와 쓰기에 대한 흥미와 자신감',
      '대화 예절을 지키고 협력하며 의사소통 활동에 참여하는 태도',
    ]
  ]; //2022 영어 표현 5~6년 내용체계
//2022 영어 표현 내용체계표
}

import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class WrongAnswerBox {
  GetStorage wrongAnswerBox = GetStorage('WrongAnswerBox');
  Map<String, dynamic> clearedMap = {
    'area': '',
    'contents': '',
    'wrongNumber': 0
  };
  late Map<String, String> clearedWrongAnswerMap = {'':jsonEncode(clearedMap)};

  void writeWrongAnswerMap(Map<String, dynamic> wrongAnswerUnsortedMap) {
    wrongAnswerBox.write('WrongAnswerMap', wrongAnswerUnsortedMap);
    List<String> sortedKey = WrongAnswerMap().returnSortedKey(wrongAnswerUnsortedMap);
    wrongAnswerBox.write('SortedKey', sortedKey);
  }

  Map<String, dynamic> readWrongAnswerMap() {
    Map<String, dynamic> tempMap =  wrongAnswerBox.read('WrongAnswerMap');
    return tempMap;
  }

  List<dynamic> readSortedKey() {
    List<dynamic> tempList = wrongAnswerBox.read('SortedKey');
    return tempList;
  }
  
  void deleteWrongAnswerMap(String area, String contents) {
    Map<String, dynamic> tempMap = wrongAnswerBox.read('WrongAnswerMap');
    tempMap.remove('$area$contents');
    writeWrongAnswerMap(tempMap);
  }

  void eraseWrongAnswerMap() {
    wrongAnswerBox.erase();
    wrongAnswerBox.write('WrongAnswerMap', clearedWrongAnswerMap);
    wrongAnswerBox.write('SortedKey', ['']);
  }
}

class WrongAnswerMap {
  Map<String, String> wrongAnswerUnsortedMap = {};
  List<String> sortedKey = [];
  Map<String, int> forSortMap = {};
  Map<String, dynamic> wrongAnswerData = {};
  Map<String, dynamic> savedMap = WrongAnswerBox().readWrongAnswerMap();

  Map<String, dynamic> toWrongAnswerMap(String jsonWrongAnswer) {
    Map<String, dynamic> tempInputMap = jsonDecode(jsonWrongAnswer);
    Map<String, dynamic> tempMap = {
      'area': '',
      'contents': '',
      'wrongNumber': 0
    };
    String areaContents = tempInputMap['area'] + tempInputMap['contents'];

    if (savedMap[areaContents] == null) {
      savedMap[areaContents] = jsonWrongAnswer;
    } else {
      tempMap = jsonDecode(savedMap[areaContents]!);
      tempMap['wrongNumber'] += 1;
      savedMap[areaContents] = jsonEncode(tempMap);
    }
    return savedMap;
  }

  String encodeWrongAnswerToJson(String area, String contents) {
    wrongAnswerData['area'] = area;
    wrongAnswerData['contents'] = contents;
    wrongAnswerData['wrongNumber'] = 1;
    String jsonWrongAnswer = jsonEncode(wrongAnswerData);

    return jsonWrongAnswer;
  }

  List<String> returnSortedKey(Map<String, dynamic> wrongAnswerUnsortedMap) {
    Map<String, dynamic> tempMap = {
      'area': '',
      'contents': '',
      'wrongNumber': 0
    };

    List<String> wrongAnswerKey = [];
    wrongAnswerKey = wrongAnswerUnsortedMap.keys.toList();
    for(int i = 0; i < wrongAnswerUnsortedMap.length; i++) {
      tempMap = jsonDecode(wrongAnswerUnsortedMap[wrongAnswerKey[i]]!);
      String areaContents = wrongAnswerKey[i];
      int wrongNumber = tempMap['wrongNumber'];
      forSortMap[areaContents] = wrongNumber;
    }

    var mapEntries = forSortMap.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    forSortMap
      ..clear()
      ..addEntries(mapEntries);

    sortedKey = forSortMap.keys.toList();

    return sortedKey;
  }
}

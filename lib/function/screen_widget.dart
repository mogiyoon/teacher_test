import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSetting with ChangeNotifier {
  List<String> subject =
  ['국어', '수학', '사회', '과학', '영어', '체육', '미술', '음악', '도덕', '실과', '통합'];
  bool _subjectTableOpen = false;
  bool get subjectTableOpen => _subjectTableOpen;

  bool _subjectAchievOpen = false;
  bool get subjectAchievOpen => _subjectAchievOpen;

  int _subjectNumber = 0;
  int get subjectNumber {
    return _subjectNumber;
  }
  set subjectNumber(value) {
    return _subjectNumber = value;
  }

  void tableOpen() {
    _subjectTableOpen = true;
    _subjectAchievOpen = false;
    notifyListeners();
  }

  void achievOpen() {
    _subjectTableOpen = false;
    _subjectAchievOpen = true;
    notifyListeners();
  }

}

class SubjectDrawer extends StatefulWidget {
  @override
  SubjectDrawerState createState() => SubjectDrawerState();
}

class SubjectDrawerState extends State<SubjectDrawer> {

  Widget build(BuildContext context) {
    var screenSetting = Provider.of<ScreenSetting>(context);
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  '목록',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
              ),
              ListTile(
                title: Text('홈'),
                onTap: () async {
                  await Navigator.pushNamed(
                    context,
                    '/Main',
                  );
                  },
              ),
              ExpansionTile(
                key: GlobalKey(),
                title: Text('교육과정 내용체계표'),
                children: [
                  SubjectListBuild(),
                ],
                initiallyExpanded: screenSetting.subjectTableOpen,
                onExpansionChanged: (val){
                  if(val == true) {
                    screenSetting.tableOpen();
                    setState(() {
                    });
                  }
                },
              ),
              ExpansionTile(
                key: GlobalKey(),
                title: Text('교육과정 성취기준'),
                children: [
                  SubjectListBuild(),
                ],
                initiallyExpanded: screenSetting.subjectAchievOpen,
                onExpansionChanged: (val) {
                  if (val == true) {
                    screenSetting.achievOpen();
                    setState(() {
                    });
                  }
                }
              ),
              ListTile(
                  title: Text('총론')
              ),
            ]
        )
    );
  }
}

class SubjectListBuild extends StatefulWidget {
  @override
  State<SubjectListBuild> createState() => SubjectListBuildState();
}

class SubjectListBuildState extends State<SubjectListBuild> {

  Widget build(BuildContext context) {
    var screenSetting = Provider.of<ScreenSetting>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemExtent: 28,
        itemCount: screenSetting.subject.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            key: ValueKey((index+1).toString()),
            children: [
              Container(width: 40),
              GestureDetector(
                child: Text(
                  screenSetting.subject[index],
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () async {
                  if(screenSetting.subjectTableOpen == true) {
                    screenSetting.subjectNumber = index + 1;
                    await Navigator.pushNamed(
                      context,
                      '/TableScreen',
                      arguments: screenSetting.subjectNumber,
                    );
                  }
                  else if(screenSetting.subjectAchievOpen == true) {
                    screenSetting.subjectNumber = index + 1;
                    await Navigator.pushNamed(
                      context,
                      '/AchieveScreen',
                      arguments: screenSetting.subjectNumber,
                    );
                  }
                },
              )
            ],
          );
        });
  }
}
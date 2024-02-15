import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/setting/widget_control.dart';

class TestSetting with ChangeNotifier {
  List<String> subject = [
    '국어',
    '수학',
    '사회',
    '과학',
    '영어',
    '체육',
    '미술',
    '음악',
    '도덕',
    '실과',
    '통합'
  ];
  int _subjectNumber = 0;

  int get subjectNumber {
    return _subjectNumber;
  }

  set subjectNumber(value) {
    return _subjectNumber = value;
  }

  bool _isSubjectTableOpen = false;

  bool get isSubjectTableOpen => _isSubjectTableOpen;

  bool _isSubjectAchievOpen = false;

  bool get isSubjectAchievOpen => _isSubjectAchievOpen;

  void tableOpen() {
    _isSubjectAchievOpen = false;
    _isSubjectTableOpen = true;
    notifyListeners();
  }

  void achievOpen() {
    _isSubjectTableOpen = false;
    _isSubjectAchievOpen = true;
    notifyListeners();
  }
}

class SubjectDrawer extends StatefulWidget {
  @override
  SubjectDrawerState createState() => SubjectDrawerState();
}

class SubjectDrawerState extends State<SubjectDrawer> {
  Widget build(BuildContext context) {
    var testSetting = Provider.of<TestSetting>(context);
    var widgetControl = Provider.of<WidgetControlProvider>(context);

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
              widgetControl.routeName = '/Main';
              await Navigator.pushNamedAndRemoveUntil(
                context,
                '/Main',
                (r) => false,
              );
            },
          ),
          ExpansionTile(
            key: GlobalKey(),
            title: Text('교육과정 내용체계표'),
            children: [
              SubjectListBuild(),
            ],
            initiallyExpanded: testSetting.isSubjectTableOpen,
            onExpansionChanged: (val) {
              if (val == true) {
                testSetting.tableOpen();
                setState(() {});
              }
            },
          ),
          ExpansionTile(
              key: GlobalKey(),
              title: Text('교육과정 성취기준'),
              children: [
                SubjectListBuild(),
              ],
              initiallyExpanded: testSetting.isSubjectAchievOpen,
              onExpansionChanged: (val) {
                if (val == true) {
                  testSetting.achievOpen();
                  setState(() {});
                }
              }),
          ListTile(
            title: Text('총론'),
            onTap: () async {
              widgetControl.routeName = '/EducationIntroductionScreen';
              await Navigator.pushNamedAndRemoveUntil(
                context,
                '/EducationIntroductionScreen',
                (r) => false,
              );
            },
          ),
          ListTile(
            title: Text('설정'),
            onTap: () async {
              widgetControl.routeName = '/SettingScreen';
              await Navigator.pushNamedAndRemoveUntil(
                context,
                '/SettingScreen',
                (r) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SubjectListBuild extends StatefulWidget {
  @override
  State<SubjectListBuild> createState() => SubjectListBuildState();
}

class SubjectListBuildState extends State<SubjectListBuild> {
  Widget build(BuildContext context) {
    var testSetting = Provider.of<TestSetting>(context);
    var widgetControl = Provider.of<WidgetControlProvider>(context);

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemExtent: 28,
        itemCount: testSetting.subject.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            key: ValueKey((index + 1).toString()),
            children: [
              Container(width: 40),
              GestureDetector(
                child: Text(
                  testSetting.subject[index],
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () async {
                  widgetControl.routeName = '/TestScreen';
                  testSetting.subjectNumber = index + 1;
                  await Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/TestScreen',
                    arguments: {
                      'arg1': testSetting.subjectNumber,
                      'arg2': testSetting.isSubjectTableOpen,
                      'arg3': testSetting.isSubjectAchievOpen,
                    },
                    (r) => false,
                  );
                },
              )
            ],
          );
        });
  }
}

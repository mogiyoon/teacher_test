import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/main.dart';
import 'package:teacher_test/function/speeddial_widget.dart';
import 'package:teacher_test/function/screen_widget.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/contents/contents.dart';

class RouteContents with ChangeNotifier {
  int _subjectNum = 0;

  int get subjectNum {
    return _subjectNum;
  }

  set subjectNum(value) {
    _subjectNum = value;
  }

  bool _isTableTest = false;

  bool get isTableTest {
    return _isTableTest;
  }

  set isTableTest(value) {
    _isTableTest = value;
  }

  bool _isAchieveTest = false;

  bool get isAchieveTest {
    return _isAchieveTest;
  }

  set isAchieveTest(value) {
    _isAchieveTest = value;
  }

  void same(int value) {
    _subjectNum = value;
    notifyListeners();
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    var screenSetting = ScreenSetting();
    String tableTitle = screenSetting.subject[routeContents.subjectNum - 1];

    return Column(
      children: [
        if (routeContents.isTableTest) Text('[' + tableTitle + '] 내용체계표'),
        if (routeContents.isAchieveTest) Text('[' + tableTitle + '] 교육과정 성취기준'),
      ],
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          Provider<Map>.value(value: args),
          ChangeNotifierProvider<RouteContents>.value(
            value: RouteContents(),
          ),
        ],
        child: TestScreenWidget(),
      ),
      routes: {
        '/Main': (context) => MyHomePage(title: '초등임용 헬퍼'),
        '/TestScreen': (context) => TestScreen(),
      },
    );
  }
}

class TestScreenWidget extends StatefulWidget {
  @override
  State<TestScreenWidget> createState() => TestScreenWidgetState();
}

class TestScreenWidgetState extends State<TestScreenWidget> {
  @override
  Widget build(BuildContext context) {
    late Map args = Provider.of<Map>(context);
    var routeContents = Provider.of<RouteContents>(context);
    routeContents.subjectNum = args['arg1'] as int;
    routeContents.isTableTest = args['arg2'] as bool;
    routeContents.isAchieveTest = args['arg3'] as bool;

    var achieve22 = Achieve22();
    int subjectNum = routeContents.subjectNum;

    return ChangeNotifierProvider<AchieveTextEditing>.value(
      value: AchieveTextEditing(
          achieve22.contentsAchieve22[subjectNum - 1].length),
      child: Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Title(),
          centerTitle: true,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: '목록');
          }),
        ),
        body: ChoiceContents(),
        drawer: ChangeNotifierProvider<ScreenSetting>.value(
          value: ScreenSetting(),
          child: SubjectDrawer(),
        ),
        floatingActionButton:
            MultiFloatButton(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

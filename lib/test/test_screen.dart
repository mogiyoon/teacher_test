import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/router.dart';
import 'package:teacher_test/setting/widget_control.dart';
import 'package:teacher_test/function/widget/speeddial_widget.dart';
import 'package:teacher_test/function/widget/screen_widget.dart';
import 'package:teacher_test/test/achieve_builder.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/test_contents.dart';

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
      routes: ScreenRouter().routeIndex(),
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
    int subjectNum = routeContents.subjectNum;

    var widgetControl = Provider.of<WidgetControlProvider>(context);
    var textEditRouter = widgetControl.textEditRouter;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AchieveTextEditing>.value(
            value: textEditRouter.returnAchieveTextEditing(subjectNum)),
        //Achieve
        ChangeNotifierProvider<TableTextEditing>.value(
            value: textEditRouter.returnTableTextEditing(subjectNum)),
        //Table
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
        drawer: ChangeNotifierProvider<TestSetting>.value(
          value: TestSetting(),
          child: SubjectDrawer(),
        ),
        floatingActionButton: MultiFloatButton(),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    var routeContents = Provider.of<RouteContents>(context);
    var testSetting = TestSetting();
    String tableTitle = testSetting.subject[routeContents.subjectNum - 1];

    return Column(
      children: [
        if (routeContents.isTableTest) Text('[' + tableTitle + '] 내용체계표'),
        if (routeContents.isAchieveTest) Text('[' + tableTitle + '] 교육과정 성취기준'),
      ],
    );
  }
}

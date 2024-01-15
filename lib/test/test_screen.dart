import 'package:flutter/material.dart';
import 'package:teacher_test/main.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/function/screen_widget.dart';

class RouteContents with ChangeNotifier {
  int _subjectNum = 0;
  int get subjectNum {
    return _subjectNum;
  }
  set subjectNum(value) {
    _subjectNum = value;
  }

  bool _tableTest = false;
  bool get tableTest {
    return _tableTest;
  }
  set tableTest(value) {
    _tableTest = value;
  }

  bool _achieveTest = false;
  bool get achieveTest {
    return _achieveTest;
  }
  set achieveTest(value) {
    _achieveTest = value;
  }

  void same(int value) {
    _subjectNum = value;
    notifyListeners();
  }


}

class AchieveScreen extends StatelessWidget{
  const AchieveScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute
        .of(context)!
        .settings.arguments as Map<String, Object>;

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
        child: AchieveScreenWidget(),
      ),
      routes: {
        '/Main': (context) => MyHomePage(title: '초등임용 헬퍼'),
        '/TestScreen': (context) => AchieveScreen(),
      },
    );
  }
}

class AchieveScreenWidget extends StatefulWidget {

  @override
  State<AchieveScreenWidget> createState() => AchieveScreenWidgetState();
}

class AchieveScreenWidgetState extends State<AchieveScreenWidget> {

  @override
  Widget build(BuildContext context) {
    late Map args = Provider.of<Map>(context);
    var routeContents = Provider.of<RouteContents>(context);
    routeContents.subjectNum = args['arg1'] as int;
    routeContents.tableTest = args['arg2'] as bool;
    routeContents.achieveTest = args['arg3'] as bool;

    var screenSetting = ScreenSetting();
    String tableTitle = screenSetting.subject[routeContents.subjectNum-1];

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('[' + tableTitle + '] 교육과정 성취기준'),
        centerTitle: true,
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: '목록'
              );
            }
        ),
      ),
      body: TestTable(),
      drawer: ChangeNotifierProvider<ScreenSetting>.value(
        value: ScreenSetting(),
        child: SubjectDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '정답 확인',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

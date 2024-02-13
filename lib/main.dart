import 'package:flutter/material.dart';
import 'package:teacher_test/db/setting_db.dart';
import 'package:teacher_test/function/screen_router.dart';
import 'package:teacher_test/function/screen_widget.dart';
import 'package:teacher_test/main/main_widget.dart';
import 'package:teacher_test/setting/setting_screen.dart';
import 'package:teacher_test/setting/widget_control.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/test/test_screen.dart';

//TODO 구글/애플 계정 연동 및 구독 시스템

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SettingDB.db();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WidgetControl(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Teacher Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: ScreenRouter().routeIndex(),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SaveSetting> _settings = [];
  bool _isSettingLoading = false;

  void _refreshSetting() async {
    final data = await SettingDB.getSaveSetting();
    setState(() {
      _settings = data;
      _isSettingLoading = true;
    });
  }

  void initSetting(context) {
    var widgetControl = Provider.of<WidgetControl>(context);
    double adjustSize = widgetControl.widgetFontSize.adjustSize;
    bool isIncludeSpace = widgetControl.spaceSwitch.isIncludeSpace;
    var saveSetting = SaveSetting(
        id: 0, adjustSize: adjustSize, isIncludeSpace: isIncludeSpace);

    if (_isSettingLoading) {
      if (_settings.isEmpty) {
        SettingDB.insertSaveSetting(saveSetting);
      } else if (_settings.length == 1) {
        widgetControl.widgetFontSize.adjustSize = _settings[0].adjustSize;
        widgetControl.spaceSwitch.isIncludeSpace =_settings[0].isIncludeSpace;
      } else {
        for (int i = 0; i < _settings.length; i++)
          SettingDB.deleteSaveSetting(i);
      }
      _isSettingLoading = false;
    }
  }

  void initState() {
    super.initState();
    _refreshSetting();
  }

  @override
  Widget build(BuildContext context) {
    initSetting(context);

    final double inputUnitHeightValue =
        MediaQuery.of(context).size.height * 0.01;
    var widgetControl = Provider.of<WidgetControl>(context);
    widgetControl.widgetFontSize.returnFontSize(inputUnitHeightValue);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('초등임용 헬퍼'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Timer(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Placeholder(),
                )
              ],
            ),
          ],
        ),
      ),
      drawer: ChangeNotifierProvider<TestSetting>.value(
        value: TestSetting(),
        child: SubjectDrawer(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

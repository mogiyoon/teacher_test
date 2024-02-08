import 'package:flutter/material.dart';
import 'package:teacher_test/setting/setting_screen.dart';
import 'package:teacher_test/setting/widget_control.dart';
import 'test/test_screen.dart';
import 'function/screen_widget.dart';
import 'package:provider/provider.dart';

//TODO 구글/애플 계정 연동 및 구독 시스템

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WidgetControl>.value(
        value: WidgetControl(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Teacher Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            '/Main': (context) => MyHomePage(),
            '/TestScreen': (context) => TestScreen(),
            '/SettingScreen': (context) => SettingScreen(),
          },
          initialRoute: '/Main',
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double inputUnitHeightValue = MediaQuery.of(context).size.height * 0.01;
    var widgetSetting = Provider.of<WidgetControl>(context);
    widgetSetting.widgetFontSize.returnFontSize(inputUnitHeightValue);
    double widgetBigFontSize = widgetSetting.widgetFontSize.bigFontSize;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          '초등임용 헬퍼',
          style: TextStyle(fontSize: widgetBigFontSize),
        ),
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
          children: <Widget>[],
        ),
      ),
      drawer: ChangeNotifierProvider<TestSetting>.value(
        value: TestSetting(),
        child: SubjectDrawer(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

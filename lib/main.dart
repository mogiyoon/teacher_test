import 'package:flutter/material.dart';
import 'package:teacher_test/function/setting.dart';
import 'test/test_screen.dart';
import 'function/screen_widget.dart';
import 'package:provider/provider.dart';

//TODO 휴대폰 사용시 글자크기 축소
//TODO 두 손가락으로 확대 축소
//TODO 구글/애플 계정 연동 및 구독 시스템
//TODO 단축키
//TODO Setting 화면 추가

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WidgetSetting>.value(
      value: WidgetSetting(context),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Teacher Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            '/Main': (context) => MyHomePage(title: '초등임용 헬퍼'),
            '/TestScreen': (context) => TestScreen(),
          },
          initialRoute: '/Main',
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var widgetSetting = Provider.of<WidgetSetting>(context);
    double widgetBigFontSize = widgetSetting.widgetFontSize.bigFontSize;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(fontSize: widgetBigFontSize),),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      drawer: ChangeNotifierProvider<ScreenSetting>.value(
        value: ScreenSetting(),
        child: SubjectDrawer(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

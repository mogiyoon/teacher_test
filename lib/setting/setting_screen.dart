import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/screen_widget.dart';
import 'package:teacher_test/main.dart';
import 'package:teacher_test/setting/widget_control.dart';
import 'package:teacher_test/test/test_screen.dart';

//TODO 단축키

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SettingScreenWidget(),
      routes: {
        '/Main': (context) => MyHomePage(),
        '/TestScreen': (context) => TestScreen(),
        '/SettingScreen': (context) => SettingScreen(),
      },
    );
  }
}

class SettingScreenWidget extends StatefulWidget {
  const SettingScreenWidget({super.key});

  @override
  State<SettingScreenWidget> createState() => _SettingScreenWidgetState();
}

class _SettingScreenWidgetState extends State<SettingScreenWidget> {
  @override
  Widget build(BuildContext context) {
    var widgetSetting = Provider.of<WidgetControl>(context);
    double widgetBigFontSize = widgetSetting.widgetFontSize.bigFontSize;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('설정', style: TextStyle(fontSize: widgetBigFontSize)),
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
      body: SettingScreenBuilder(),
      drawer: ChangeNotifierProvider<TestSetting>.value(
        value: TestSetting(),
        child: SubjectDrawer(),
      ),
    );
  }
}

class SettingScreenBuilder extends StatelessWidget {
  const SettingScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

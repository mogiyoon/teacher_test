import 'package:flutter/material.dart';
import 'package:teacher_test/main.dart';
import 'package:teacher_test/table_screen/table_screen.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/achieve_screen/achieve_contents.dart';
import 'package:teacher_test/function/screen_widget.dart';

class RouteArgs with ChangeNotifier {
  int _args = 0;
  int get args {
    return _args;
  }
  set args(value) {
    _args = value;
  }

  void same(int value) {
    _args = value;
    print('same _args : $_args');
    print('same args : $args');
    notifyListeners();
  }
}

class AchieveScreen extends StatelessWidget{
  const AchieveScreen({super.key});


  @override
  Widget build(BuildContext context) {
    late int num = ModalRoute.of(context)!.settings.arguments as int;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          Provider<int>.value(value: num,),
          ChangeNotifierProvider<RouteArgs>.value(
            value: RouteArgs(),
          ),
        ],
        child: AchieveScreenWidget(),
      ),
      routes: {
        '/Main': (context) => MyHomePage(title: '초등임용 헬퍼'),
        '/TableScreen': (context) => TableScreen(),
        '/AchieveScreen': (context) => AchieveScreen(),
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
    var routeArgs = Provider.of<RouteArgs>(context);
    routeArgs.args = Provider.of<int>(context);

    var screenSetting = ScreenSetting();
    String tableTitle = screenSetting.subject[routeArgs.args-1];

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
      body: AchieveTable(),
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

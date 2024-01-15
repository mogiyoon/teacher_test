import 'package:flutter/material.dart';
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
    final int num = ModalRoute.of(context)!.settings.arguments as int;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<RouteArgs>.value(
        value: RouteArgs(),
        child: AchieveScreenWidget(),
      )
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

    var screenSetting = ScreenSetting();
    String tableTitle = screenSetting.subject[0];

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
      body: KoreanAchieveTable(),
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

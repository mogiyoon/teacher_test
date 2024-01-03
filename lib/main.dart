import 'package:flutter/material.dart';
import 'package:teacher_test/achieve_screen.dart';
import 'table_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/Main': (context) => MyHomePage(title: '초등임용 헬퍼'),
        '/TableScreen': (context) => TableScreenWidget(),
        '/AchieveScreen': (context) => AchieveScreenWidget(),
      },
      initialRoute: '/Main',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

mixin setting<T extends StatefulWidget> on State<T> {
  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;

    super.setState(fn);
  }

  List<String> subject =
  ['국어', '수학', '사회', '과학', '영어', '체육', '미술', '음악', '도덕', '실과', '통합'];

  var subjectDrawer;
  var subjectListBuild;

  bool subjectTableOpen = false;
  bool subjectAchievOpen = false;
  int subjectNumber = 0;

  subInitializeDrawer() {
    subjectDrawer = Drawer(
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
              ExpansionTile(
                key: GlobalKey(),
                title: Text('교육과정 내용체계표'),
                children: [
                  subjectListBuild
                ],
                initiallyExpanded: subjectTableOpen,
                onExpansionChanged: (val){
                  if(val == true){
                    subjectAchievOpen = false;
                    setState(() {

                    });
                    subjectTableOpen = val;
                  }
                },
              ),
              ExpansionTile(
                key: GlobalKey(),
                title: Text('교육과정 성취기준'),
                children: [
                  subjectListBuild
                ],
                initiallyExpanded: subjectAchievOpen,
                onExpansionChanged: (val){
                  if(val == true){
                    subjectTableOpen = false;
                    setState(() {

                    });
                    subjectAchievOpen = val;
                  }
                },
              ),
              ListTile(
                  title: Text('총론')
              ),
            ]
        )
    );
  }
  subInitializeList() {
    subjectListBuild = ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemExtent: 28,
        itemCount: subject.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            key: ValueKey((index+1).toString()),
            children: [
              Container(width: 40),
              GestureDetector(
                child: Text(
                  subject[index],
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () async {
                  if(subjectTableOpen == true) {
                    subjectNumber = index+1;
                    await Navigator.pushNamed(
                      context,
                      '/TableScreen',
                      arguments: subjectNumber,
                    );
                  }
                  else if(subjectAchievOpen == true) {
                    subjectNumber = index+1;
                    await Navigator.pushNamed(
                      context,
                      '/AchieveScreen',
                      arguments: subjectNumber,
                    );
                  }
                },
              )
            ],
          );
        }
    );
  }
}

class _MyHomePageState extends State<MyHomePage> with setting {

  @override
  Widget build(BuildContext context) {
    subInitializeList();
    subInitializeDrawer();

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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
      drawer: subjectDrawer,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '정답 확인',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

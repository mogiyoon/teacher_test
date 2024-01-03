import 'package:flutter/material.dart';
import 'main.dart';

class TableScreen extends StatelessWidget{
  const TableScreen({super.key});


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
      home: TableScreenWidget(),
    );
  }
}

class TableScreenWidget extends StatefulWidget {

  @override
  State<TableScreenWidget> createState() => _TableScreenWidgetState();
}

class _TableScreenWidgetState extends State<TableScreenWidget> with setting {

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context)?.settings.arguments as int;
    String tableTitle = subject[args-1];
    subInitializeList();
    subInitializeDrawer();
    tableScreen Scrn = new tableScreen();

    var realScreen;
    switch(args-1) {
      case 0: realScreen = Scrn.scrn1;
      case 1: realScreen = Scrn.scrn2;
      break;
    }

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('[' + tableTitle + '] 교육과정 내용체계표'),
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
      body: realScreen,
      drawer: subjectDrawer,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '정답 확인',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class initialSetting extends _TableScreenWidgetState {
  final generalForm = Center(
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none
      ),
    ),
  );
}

class tableScreen extends initialSetting {
  tableScreen() : super();

  var scrn1 = Column(
    children: [
      Container(
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              child: generalForm,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
          ],
        ),
      )
    ],
  );


  var scrn2 = Center(
    child: Text('수학')
  );
}


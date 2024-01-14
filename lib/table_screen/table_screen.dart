import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screenWidget.dart';

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

class _TableScreenWidgetState extends State<TableScreenWidget> {

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context)?.settings.arguments as int;
    var screenSetting = ScreenSetting();
    String tableTitle = screenSetting.subject[args-1];

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
      body: Container(),
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
class initialSetting extends _TableScreenWidgetState {
  final generalForm = Center(
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none
      ),
    ),
  );
}
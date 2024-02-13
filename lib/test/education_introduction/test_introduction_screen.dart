import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/screen_router.dart';
import 'package:teacher_test/function/screen_widget.dart';
import 'package:teacher_test/function/speeddial_widget.dart';
import 'package:teacher_test/test/education_introduction/introduction_builder.dart';
import 'package:teacher_test/test/test_contents.dart';
import 'package:teacher_test/test/test_screen.dart';

class EducationIntroductionScreen extends StatelessWidget {
  const EducationIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EducationTestScreenWidget(),
      routes: ScreenRouter().routeIndex(),
    );
  }
}

class EducationTestScreenWidget extends StatelessWidget {
  const EducationTestScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<EducationIntroductionTextEditing>.value(
              value: EducationIntroductionTextEditing())
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('총론'),
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
          body: EducationIntroductionChoice(),
          drawer: ChangeNotifierProvider<TestSetting>.value(
            value: TestSetting(),
            child: SubjectDrawer(),
          ),
          floatingActionButton: MultiFloatButton(),
        ));
  }
}

class EducationIntroductionChoice extends StatefulWidget {
  const EducationIntroductionChoice({super.key});

  @override
  State<EducationIntroductionChoice> createState() =>
      _EducationIntroductionChoiceState();
}

class _EducationIntroductionChoiceState
    extends State<EducationIntroductionChoice> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TestChoice>.value(value: TestChoice()),
        ],
        child: Column(children: [
          ExpansionTile(
            title: Center(child: Text('학년군/과목 선택')),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TestCheckBoxWidget(),
                  Text('시험'),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                EducationIntroductionTestChoiceBuilder(),
              ]),
            ),
          )
        ]));
  }
}

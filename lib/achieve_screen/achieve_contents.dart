import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/function/screen_widget.dart';
import 'package:teacher_test/achieve_screen/achieve_screen.dart';
import 'package:teacher_test/contents/contents.dart';

class KoreanAchieveTable extends StatefulWidget {
  const KoreanAchieveTable({super.key});

  @override
  State<KoreanAchieveTable> createState() => _KoreanAchieveTableState();
}

class _KoreanAchieveTableState extends State<KoreanAchieveTable> {
  @override
  Widget build(BuildContext context) {
    var routeArgs = Provider.of<RouteArgs>(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: ElevatedButton(
                  onPressed: (){
                    print('KoreanAchieveTable routeArgs : ${routeArgs.args}');
                  },
                  child: Text('print')
            ),
          ),
        ],
      ),
    );
  }
}
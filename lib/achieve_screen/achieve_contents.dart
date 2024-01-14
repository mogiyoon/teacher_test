import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/achieve_screen/achieve_screen.dart';
import 'package:teacher_test/contents/contents.dart';

class KoreanAchieveTable extends StatelessWidget {
  const KoreanAchieveTable({super.key});

  @override
  Widget build(BuildContext context) {
    var achieveScreenWidget = Provider.of<AchieveScreenWidget>(context);
    var koreanAcheiv = KoreanContents();
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            child: Builder(
              builder: (context) {
                if (achieveScreenWidget.args == 1)
                  return Text('국어');
                else
                  return Text('');
              },
            )
          )
        ],
      ),
    );
  }
}

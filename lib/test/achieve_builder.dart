import 'package:flutter/material.dart';
import 'package:teacher_test/contents/contents.dart';

class FormBuilder extends StatelessWidget {
  List<String> AchieveList;
  FormBuilder(this.AchieveList);

  @override
  Widget build(BuildContext context) {
    double heightConst = (AchieveList.length).toDouble();

    return Container(
      height: 50*(heightConst),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(30),
          itemCount: AchieveList.length,
          itemBuilder: (context, index){
            return  Container(
              height: 50,
              child: Text(AchieveList[index]),
            );
          }
      ),
    );
  }
}

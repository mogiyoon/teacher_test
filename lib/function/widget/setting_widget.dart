import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/db/wrong_answer_list_db.dart';
import 'package:teacher_test/function/widget/spatial_widget.dart';
import 'package:teacher_test/setting/widget_control.dart';

class ExampleText extends StatelessWidget {
  const ExampleText({super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControlProvider>(context);

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: 500,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Center(
                  child: Text('중심 내용을 확인한다.',
                      style: TextStyle(
                          fontSize:
                              widgetControl.widgetFontSize.mediumFontSize)))),
          Flexible(
              flex: 2,
              child: Center(
                  child: Text('중심내용을확인한다.',
                      style: TextStyle(
                          fontSize:
                              widgetControl.widgetFontSize.mediumFontSize)))),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widgetControl.spaceSwitch.isIncludeSpace)
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Wrong'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red.shade200,
                      )),
                if (!widgetControl.spaceSwitch.isIncludeSpace)
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Correct'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green.shade200,
                      )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FontSizeSlider extends StatelessWidget {
  const FontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControlProvider>(context);

    return SettingRow(
        Text('글자 크기 설정'),
        Slider(
          value: widgetControl.widgetFontSize.adjustSize * 5,
          min: 1,
          max: 10,
          divisions: 9,
          onChanged: (double value) {
            widgetControl.widgetFontSize.adjustSize = value / 5;
            widgetControl.widgetFontSize.applySize();
            widgetControl.widgetChanged();
          },
          onChangeEnd: (double value) {
            widgetControl.widgetSave();
          },
        ));
  }
}

class SpaceSwitchWidget extends StatelessWidget {
  const SpaceSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControlProvider>(context);
    bool spaceSwitch = widgetControl.spaceSwitch.isIncludeSpace;

    return SettingRow(
        Text('공백 포함 채점'),
        Switch(
            value: spaceSwitch,
            onChanged: (value) {
              widgetControl.spaceSwitch.isIncludeSpace = value;
              widgetControl.widgetChanged();
              widgetControl.widgetSave();
            }));
  }
}

class ClearWrongAnswerButton extends StatelessWidget {
  const ClearWrongAnswerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingRow(
      Text('틀린 기록 초기화'),
      ElevatedButton(
        onPressed: () {
          WrongAnswerBox().eraseWrongAnswerMap();
        },
        child: Text('초기화'),
      ),
    );
  }
}

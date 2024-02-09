import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/setting/widget_control.dart';

class CopyWithText extends StatelessWidget {
  String inputString;

  CopyWithText(this.inputString, {super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControl>(context);
    double controlledMediumFontSize =
        widgetControl.widgetFontSize.mediumFontSize;

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () async {
        widgetControl.clipBoard.copyString = inputString;
        await Clipboard.setData(ClipboardData(text: inputString));
      },
      child: Container(
          child: Text(
        inputString,
        style: TextStyle(fontSize: controlledMediumFontSize),
      )),
    );
  }
}

class CopyWithBigText extends StatelessWidget {
  String inputString;

  CopyWithBigText(this.inputString, {super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControl>(context);
    double controlledBigFontSize =
        widgetControl.widgetFontSize.bigFontSize;

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () async {
        widgetControl.clipBoard.copyString = inputString;
        await Clipboard.setData(ClipboardData(text: inputString));
      },
      child: Container(
          child: Text(
            inputString,
            style: TextStyle(fontSize: controlledBigFontSize),
          )),
    );
  }
}

class SizedText extends StatelessWidget {
  String inputString;

  SizedText(this.inputString, {super.key});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControl>(context);
    double controlledMediumFontSize =
        widgetControl.widgetFontSize.mediumFontSize;

    return Text(
      inputString,
      style: TextStyle(fontSize: controlledMediumFontSize),
    );
  }
}

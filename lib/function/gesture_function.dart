import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/setting/widget_control.dart';

class CopyWithText extends StatelessWidget {
  String inputString;
  TextStyle? style;
  CopyWithText(this.inputString, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    var widgetControl = Provider.of<WidgetControl>(context);

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () async {
        widgetControl.clipBoard.copyString = inputString;
        await Clipboard.setData(ClipboardData(text: inputString));
      },
      child: Container(child: Text(inputString)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:teacher_test/test/table/table_test_builder.dart';
import 'package:teacher_test/test/table/table_text_builder.dart';

class ContainerWithBorder extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  BoxConstraints? constraints;
  GlobalKey? key;

  ContainerWithBorder(
      {this.child, this.width, this.height, this.constraints, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Center(
        child: child,
      ),
      width: width,
      height: height,
      constraints: constraints,
    );
  }
}

class TableTextContainerWithKey extends StatefulWidget {
  final Widget? child;
  final double? width;
  final BoxConstraints? constraints;
  final int areaNum;

  const TableTextContainerWithKey(this.areaNum,
      {this.child, this.width, this.constraints, super.key});

  @override
  State<TableTextContainerWithKey> createState() =>
      _TableTextContainerWithKeyState();
}

class _TableTextContainerWithKeyState extends State<TableTextContainerWithKey> {
  late TableTextCentralIdeaState? CIWidget =
      context.findAncestorStateOfType<TableTextCentralIdeaState>();
  late GlobalKey CIKey =
      CIWidget?.centralIdeaTextKeyList[widget.areaNum] ?? GlobalKey();
  double? sizeHeight;

  double? _getSizeHeight() {
    if (CIKey != null) {
      RenderBox renderBox =
          CIKey.currentContext!.findRenderObject() as RenderBox;
      sizeHeight = renderBox.size.height;
      return sizeHeight;
    }
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        sizeHeight = _getSizeHeight();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Center(
        child: widget.child,
      ),
      width: widget.width,
      height: sizeHeight,
      constraints: widget.constraints,
    );
  }
}

class TableTestContainerWithKey extends StatefulWidget {
  final Widget? child;
  final double? width;
  final BoxConstraints? constraints;
  final int areaNum;

  const TableTestContainerWithKey(this.areaNum,
      {this.child, this.width, this.constraints, super.key});

  @override
  State<TableTestContainerWithKey> createState() =>
      _TableTestContainerWithKeyState();
}

class _TableTestContainerWithKeyState extends State<TableTestContainerWithKey> {
  late TableTestCentralIdeaState? CIWidget =
      context.findAncestorStateOfType<TableTestCentralIdeaState>();
  late GlobalKey CIKey =
      CIWidget?.centralIdeaTestKeyList[widget.areaNum] ?? GlobalKey();
  double? sizeHeight;

  double? _getSizeHeight() {
    if (CIKey != null) {
      RenderBox renderBox =
          CIKey.currentContext!.findRenderObject() as RenderBox;
      sizeHeight = renderBox.size.height;
      return sizeHeight;
    }
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        sizeHeight = _getSizeHeight();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Center(
        child: widget.child,
      ),
      width: widget.width,
      height: sizeHeight,
      constraints: widget.constraints,
    );
  }
}

class ColorContainer extends StatelessWidget {
  Color containerColor;

  ColorContainer(this.containerColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: containerColor,
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  Widget child1;
  Widget child2;

  SettingRow(this.child1, this.child2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(flex: 1, child: Center(child: child1)),
      Flexible(flex: 2, child: Container()),
      Flexible(flex: 1, child: Center(child: child2))
    ]);
  }
}

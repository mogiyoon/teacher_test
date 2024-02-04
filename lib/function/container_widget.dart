import 'package:flutter/material.dart';
import 'package:teacher_test/test/table/table_builder.dart';
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

class ContainerWithKey extends StatefulWidget {
  final Widget? child;
  final double? width;
  final BoxConstraints? constraints;
  final int areaNum;

  const ContainerWithKey(this.areaNum,
      {this.child, this.width, this.constraints, super.key});

  @override
  State<ContainerWithKey> createState() => _ContainerWithKeyState();
}

class _ContainerWithKeyState extends State<ContainerWithKey> {
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

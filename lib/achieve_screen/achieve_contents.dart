import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/achieve_screen/achieve_screen.dart';
import 'package:teacher_test/contents/contents.dart';

class AchieveTable extends StatefulWidget {
  const AchieveTable({super.key});

  @override
  State<AchieveTable> createState() => _AchieveTableState();
}

class _AchieveTableState extends State<AchieveTable> {
  @override
  Widget build(BuildContext context) {
    var routeArgs = Provider.of<RouteArgs>(context);
    int pageNum = routeArgs.args;
    return Container(
      child: Column(
        children: [
          Container(
          ),
        ],
      ),
    );
  }
}
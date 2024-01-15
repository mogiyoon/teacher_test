import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_test/test/test_screen.dart';
import 'package:teacher_test/contents/contents.dart';

class TestTable extends StatefulWidget {
  const TestTable({super.key});

  @override
  State<TestTable> createState() => _TestTableState();
}

class _TestTableState extends State<TestTable> {
  @override
  Widget build(BuildContext context) {
    var routeArgs = Provider.of<RouteContents>(context);
    int pageNum = routeArgs.subjectNum;
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
import 'package:flutter/material.dart';

class ContainerWithBorder extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;

  ContainerWithBorder({this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Center(
          child: child,
        ),
        width: width,
        height: height,
        constraints: BoxConstraints(minHeight: 80));
  }
}

class TableTestChoiceBuilder extends StatelessWidget {
  const TableTestChoiceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return TableBuilder();
  }
}

class TableBuilder extends StatelessWidget {
  const TableBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table('핵심')
      ],
    );
  }
}

class Table extends StatelessWidget {
  String title;
  Table(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Center(
              child: Text(title)),
            CentralIdea(),
            Category(),
            LowerCategory('지식·이해'),
            LowerCategory('과정·기능'),
            LowerCategory('가치·태도'),
          ],
        ));
  }
}

class CentralIdea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ContainerWithBorder(
              child: Text('핵심 아이디어'),
            ),
          ),
          Expanded(
              flex: 3,
              child: ContainerWithBorder(
//Todo 핵심아이디어 Text, TextFormField
                  ))
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ContainerWithBorder(
              child: Text('범주'),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                constraints: BoxConstraints(maxHeight: 80),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ContainerWithBorder(
                          child: Text('내용 요소'),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: ContainerWithBorder(
                                  child: Text('1~2학년군'),
                                )),
                            Expanded(
                              flex: 1,
                              child: ContainerWithBorder(child: Text('3~4학년군')),
                            ),
                            Expanded(
                                flex: 1,
                                child:
                                    ContainerWithBorder(child: Text('5~6학년군')))
                          ],
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class LowerCategory extends StatelessWidget {
  String title;
  LowerCategory(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ContainerWithBorder(
                        child: Text(title),
                      )),
                  //Todo If문 추가 (2개 이상일 때 Coulmn으로 나누기)
                  Expanded(
                      flex: 3,
                      child: ContainerWithBorder(
                          //Todo 지식 이해 관련 LIST
                          ))
                ],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  //Todo 학년군 체크시 사용할 IF문 추가
                  Expanded(
                      flex: 1,
                      child: ContainerWithBorder(
                          //Todo 지식 이해 관련 내용요소 LIST
                          )),
                  Expanded(
                      flex: 1,
                      child: ContainerWithBorder(
                          //Todo 지식 이해 관련 내용요소 LIST
                          )),
                  Expanded(
                      flex: 1,
                      child: ContainerWithBorder(
                          //Todo 지식 이해 관련 내용요소 LIST
                          )),
                ],
              ))
        ],
      ),
    );
  }
}

class ContentsContainerBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: itemBuilder);
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyReorderableListView extends StatefulWidget {
  @override
  _KegGameState createState() => _KegGameState();
}

class _KegGameState extends State<MyReorderableListView> {

  final boxs = [
    Box(color: Colors.blue[100], key: UniqueKey()),
    Box(color: Colors.blue[300], key: UniqueKey()),
    Box(color: Colors.blue[500], key: UniqueKey()),
    Box(color: Colors.blue[700], key: UniqueKey()),
    Box(color: Colors.blue[900], key: UniqueKey()),
  ];

  _shuffle() {
    setState(() => boxs.shuffle());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeyGame'),
      ),
      body: Container(
        child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              if (newIndex > oldIndex) {
                newIndex--;
              }
              var oldBox = boxs.removeAt(oldIndex);
              boxs.insert(newIndex, oldBox);
            },
            children: boxs),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: Container(
          child: Text('洗牌'),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final Color color;
  const Box({Key key, this.color})
      : assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 50,
      height: 50,
      color: color,
    );
  }
}

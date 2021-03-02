import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxGame extends StatefulWidget {
  @override
  _KegGameState createState() => _KegGameState();
}

class _KegGameState extends State<BoxGame> {
  MaterialColor _color = Colors.blue;
  GlobalKey globalKey = GlobalKey();
  var _colors = [];
  int _slots;

  _shuffle() {
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _colors = List.generate(8, (index) => _color[(index + 1) * 100]);
    setState(() => _colors.shuffle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeyGame'),
      ),
      body: Listener(
        onPointerMove: (e) {
          var currenty = e.position.dy;
          var dy = (globalKey.currentContext.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero)
              .dy;
          if (currenty >= (_slots + 1) * RedBox.height + dy) {
            setState(() {
              if (_slots == _colors.length - 1) return;
              var d = _colors[_slots];
              _colors[_slots] = _colors[_slots + 1];
              _colors[_slots + 1] = d;
              _slots++;
            });
          }

          if (currenty < _slots * RedBox.height + dy) {
            setState(() {
              if (_slots == 0) return;
              var d = _colors[_slots];
              _colors[_slots] = _colors[_slots - 1];
              _colors[_slots - 1] = d;
              _slots--;
            });
          }
        },
        child: Container(
          child: Stack(
            key: globalKey,
            children: List.generate(
              _colors.length,
              (index) => RedBox(
                color: _colors[index],
                left: 200.0,
                top: RedBox.width * index,
                startedFunction: (Color color) {
                  _slots = _colors.indexOf(color);
                },
              ),
            ),
          ),
        ),
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


class RedBox extends StatelessWidget {
  static const double width = 50.0;
  static const double height = 50.0;
  static const double margin = 2.0;
  final Function(Color) startedFunction;
  final Color color;
  final double left, top;
  RedBox(
      {@required this.left,
      @required this.top,
      @required this.color,
      @required this.startedFunction})
      : super(key: ValueKey(color));

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(microseconds: 100),
      left: left,
      top: top,
      child: Draggable(
        onDragStarted: () {
          startedFunction(color);
        },
        onDragEnd: (e) {
          print('拖拽停止...$e');
        },
        feedback: Container(
          margin: EdgeInsets.all(8.0),
          width: width - margin * 2,
          height: height - margin * 2,
          color: color,
        ),
        childWhenDragging: Container(
          margin: EdgeInsets.all(8.0),
          width: width - margin * 2,
          height: height - margin * 2,
        ),
        child: Container(
          margin: EdgeInsets.all(8.0),
          width: width - margin * 2,
          height: height - margin * 2,
          color: color,
        ),
      ),
    );
  }
}

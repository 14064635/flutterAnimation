import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///键盘游戏
class KeyBordGame extends StatefulWidget {
  @override
  _KeyBordGameState createState() => _KeyBordGameState();
}

class _KeyBordGameState extends State<KeyBordGame> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Flex(
            direction: orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              for (var i = 0; i < 115; i++)
                Box(
                  myColor: Colors.red,
                  key: ValueKey(i),
                ),
            ],
          );
        },
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color myColor;
  final Key key;

  const Box({Key this.key, this.myColor}) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(45),
      color: Colors.amber,
      child: GestureDetector(
        onTap: () {
          setState(() {
            count++;
          });
        },
        child: Container(
            width: 40,
            color: Colors.brown,
            child: Center(child: Text('$count'))),
      ),
    );
  }
}

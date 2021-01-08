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
    var orientation = MediaQuery.of(context).orientation == Orientation.portrait
        ? Axis.vertical
        : Axis.horizontal;
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: 14,
        scrollDirection: orientation,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 100,
                width: 100,
                child: Text(
                  '$index',
                ),
                key: Key('$index'),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Container(
          child: Center(child: Text('$count')),
          width: 40,
          height: 40,
          color: widget.myColor),
    );
  }
}

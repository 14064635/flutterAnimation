import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///游戏Game
class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  GlobalKey key = GlobalKey();
  var control = StreamController.broadcast();
  var keyBordHeight = 0.0;

  var score = 0;
  var error = 0;
  var level = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    control.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    keyBordHeight = MediaQuery.of(context).size.width / 2.7;
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: control.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Text('you entered:${snapshot.data}');
            }
            return Text('还没有Data');
          },
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '得分：',
                      style: TextStyle(fontSize: 25, color: Colors.amber),
                    ),
                  ),
                  Container(
                    child: Text(
                      '$score',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '失败：',
                        style: TextStyle(fontSize: 25, color: Colors.amber),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$error',
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '关卡：',
                        style: TextStyle(fontSize: 25, color: Colors.amber),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$level',
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Puzzle(
              stream: control.stream,
              positionY: keyBordHeight,
              successFun: () {
                setState(() {
                  score++;
                });
              },
              errorFun: () {
                setState(() {
                  error++;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: KeyBoard(
                key: key,
                streamController: control,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyBoard extends StatefulWidget {
  final StreamController streamController;

  const KeyBoard({Key key, this.streamController}) : super(key: key);

  @override
  _KeyBoardState createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.7,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 12,
        ),
        shrinkWrap: false,
        itemBuilder: (BuildContext context, int myIndex) {
          if (myIndex == 3) {
            return MyButton(
              color: Colors.brown,
              text: '0',
              streamController: widget.streamController,
            );
          }
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Expanded(
                  child: MyButton(
                    color: Colors.primaries[myIndex * 3 + index],
                    text: '${myIndex * 3 + index + 1}',
                    streamController: widget.streamController,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final MaterialColor color;
  final StreamController streamController;
  const MyButton({this.color, Key key, this.text, this.streamController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: color)),
      child: FlatButton(
        shape: RoundedRectangleBorder(),
        color: color[100],
        onPressed: () {
          streamController.add(int.parse(text));
        },
        child: Text(
          '$text',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

///出题版
class Puzzle extends StatefulWidget {
  ///Y位置
  final num positionY;
  final Stream stream;
  final Function successFun;
  final Function errorFun;

  const Puzzle(
      {Key key, this.stream, this.positionY, this.errorFun, this.successFun})
      : super(key: key);

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Color color;
  var a = 0;
  var b = 0;
  double paddingXc = 0.0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..forward();
    resetNum();
    widget.stream.listen(
      (event) {
        if (event == (a + b)) {
          resetNum();
          paddingXc =
              Random().nextDouble() * (MediaQuery.of(context).size.width - 100);
          animationController.forward(from: 0.0);
          widget.successFun();
        } else {
          widget.errorFun();
        }
      },
    );
    //
    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          resetNum();
          paddingXc =
              Random().nextDouble() * (MediaQuery.of(context).size.width - 100);
          animationController.forward(from: 0.0);
          widget.errorFun();
        }
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void resetNum() {
    a = Random().nextInt(5);
    b = Random().nextInt(5);
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)][100];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Positioned(
          left: paddingXc,
          top: (MediaQuery.of(context).size.height - (widget.positionY + 110)) *
              animationController.value,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              '$a+$b=?',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        );
      },
    );
  }
}

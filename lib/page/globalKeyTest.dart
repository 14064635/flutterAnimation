import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalKeyTest extends StatelessWidget {
  void testTask() {
    scheduleMicrotask(() => print('microtask 1'));
    print('main taks 1');
    Future.value(getName('Future.value'))
        .then((value) => print('then.${value}'));
    Future.microtask(() => print('Flutter.microtask1'))
        .then((value) => print('Flutter.microtask.then1'));
    print('main taks 2');
    Future.microtask(() => print('Flutter.microtask2'))
        .then((value) => print('Flutter.microtask.then2'));
    new Future(() => print('future task'));
  }

  Future<String> getName(str) async {
    print('flutterValueGetName${str}');
    return 'flutterValueGetName';
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKeyTest'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 100,
            top: 0,
            child: FlatButton(
              key: globalKey,
              onPressed: () {
                testTask();
                RenderBox renderBox =
                    globalKey.currentContext.findRenderObject();
                // print(
                //     'W:${globalKey.currentContext.size.height}H:${globalKey.currentContext.size.width}');
                // print(
                //     'x:${renderBox.localToGlobal(Offset.zero).dx}y:${renderBox.localToGlobal(Offset.zero).dy}');
              },
              child: Text("扁平按钮"),
              color: Colors.blue,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}

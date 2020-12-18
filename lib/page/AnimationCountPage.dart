import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animation/AnimationCount.dart';

class AnimationCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123'),
      ),
      body: Container(
        width: 400,
        height: 200,
        child: Row(
          children: <Widget>[
            AnimationCount(
              endNum: 5.0,
            ),
            AnimationCount(
              endNum: 2.0,
            ),
            AnimationCount(
              endNum: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationControlPage extends StatefulWidget {
  @override
  _AnimationControlPageState createState() => _AnimationControlPageState();
}

class _AnimationControlPageState extends State<AnimationControlPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animatedContainer;
  int _count = 0;
  @override
  void initState() {
    _animatedContainer =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animatedContainer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试动画控制器'),
      ),
      body: GestureDetector(
        onTap: () {
          _count++;
          if (_count % 2 == 0) {
            _animatedContainer.stop();
          } else {
            _animatedContainer.repeat();
          }
        },
        child: Container(
          child: Center(
            child: RotationTransition(
              turns: _animatedContainer,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
                child: Center(child: Text('click Me!')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
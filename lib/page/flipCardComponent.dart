import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardComponent extends StatefulWidget {
  const FlipCardComponent({Key key}) : super(key: key);

  @override
  _FlipCardComponentState createState() => _FlipCardComponentState();
}

class _FlipCardComponentState extends State<FlipCardComponent>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> frontAnimation;
  Animation<double> backAnimation;
  int animationCount = 0;

  bool isFront = true;
  bool hasHalf = false;

  AnimationController _controller;

  double opt = 1;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController.addListener(() {
      if (animationController.value > 0.5) {
        if (hasHalf == false) {
          isFront = !isFront;
        }
        hasHalf = true;
      }
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        hasHalf = false;
        if (animationCount < 1) {
          animationController.reset();
          animationController.forward();
        }
        animationCount++;
      }
    });
    frontAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));
    backAnimation = Tween(begin: 1.5, end: 2.0).animate(CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.5, 1.0, curve: Curves.easeOut)));

    _controller =
        AnimationController(duration: Duration(seconds: 6), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is completed2222222");
//        _controller.reset();
//        _controller.reverse();
//        _controller.forward();
        //开始执行
        //controller.forward();
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is dismissed");
        //controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });

  }

  animate() {
    _controller.forward();
    animationController.stop();
    animationController.value = 0;
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = 0;
    if (animationController.status == AnimationStatus.forward) {
      if (hasHalf == true) {
        value = backAnimation.value;
      } else {
        value = frontAnimation.value;
      }
    }
    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 300,
            left: 100,
            child: ScaleTransition(
              scale: Tween(begin: 0.000001, end: 1.0)
                  .chain(CurveTween(curve: Interval(0.000001, 0.12)))
                  .animate(_controller),
              child: Transform(
                transform: Matrix4.identity()..rotateY(pi * value),
                alignment: Alignment.center,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: GestureDetector(
              onTap: () {
                animate();
                setState(() {
                  opt = 0;
                });
              },
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                onEnd: () {
                  animate();
                },
                opacity: opt,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

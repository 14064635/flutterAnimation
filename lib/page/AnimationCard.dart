import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationCard extends StatefulWidget {
  @override
  _AnimationCardState createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var countAnimation = 0;
  @override
  void initState() {
    // TODO: implement initState
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
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScaleTransition(
      alignment: Alignment.center,
      scale: Tween(begin: 0.000001, end: 1.0)
          .chain(CurveTween(curve: Interval(0.000001, 0.12)))
          .animate(_controller),
      child: Container(
        color: Colors.blue,
        width: 150,
        height: 150,
      ),
    ));
  }
}

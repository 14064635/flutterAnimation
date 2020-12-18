import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationDevice extends StatefulWidget {
  @override
  _AnimationDeviceState createState() => _AnimationDeviceState();
}

class _AnimationDeviceState extends State<AnimationDevice>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var _animation;
  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is completed2222222");
//        _controller.reset();
//        _controller.reverse();
//        _controller.forward();
        //开始执行
        //controller.forward();
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

    _animation = Tween(begin: 0.0, end: 1.0);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation animationTween = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Curves.easeInBack))
        .chain(CurveTween(curve: Interval(0.3, 0.7)))
        .animate(_controller);
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _controller.forward();
            },
            child: AnimatedBuilder(
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: _controller.value,
                  child: Container(
                    width: animationTween.value,
                    height: 100 * _controller.value,
                    color: Colors.transparent,
                  ),
                );
              },
              animation: _controller,
            ),
          ),
          TweenAnimationBuilder(
            duration: Duration(seconds: 10),
            builder: (BuildContext context, double value, Widget child) {
              print('$value');
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(value*500)),
                  gradient: RadialGradient(
                    colors: [Colors.blue[600],Colors.blue[50]],
                    stops: [value,value+0.1]
                  )
                ),
                margin: EdgeInsets.only(left: value * 100, top: value * 10),
                width: 150 * value,
                height: 150 * value,
                child: Center(
                  child: Opacity(
                      opacity: value,
                      child: Text(
                        '${value}',
                        maxLines: 1,
                      )),
                ),
              );
            },
            tween: Tween(begin: 0.0001, end: 1.0),
          ),
        ],
      ),
    );
  }
}

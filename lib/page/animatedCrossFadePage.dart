import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 交叉动画，专门用于动画切换
class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  var _showFirst = true;
  var _index = 0;
  var _list = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2853553659,1775735885&fm=26&gp=0.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFadePage'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _showFirst = !_showFirst;
              // _index++;
            });
          },
          child: AnimatedCrossFade(
            firstChild: Image.network(_list[0]),
            secondChild: Image.network(_list[1]),
            // firstCurve: LinearHalfCurve(),//f(t) = t;
            // secondCurve: LinearHalfCurve().flipped, //反转曲线
            firstCurve:Interval(0.0,0.5),//f(t) = t;
            secondCurve: Interval(0.5,1.0),
            duration: Duration(seconds: 10),
            crossFadeState: _showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}

class LinearHalfCurve extends Curve {
  @override
  double transform(double t) {
    if (t < 0.5) {
      return t * 2;
    } else {
      return 1.0;
    }
  }
}

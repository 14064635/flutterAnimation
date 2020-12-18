import 'package:flutter/cupertino.dart';

class AnimationCount extends StatelessWidget {
  final Duration duration;
  final double endNum;
  const AnimationCount({this.duration, @required this.endNum})
      : assert(endNum != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 120,
      child: TweenAnimationBuilder(
        duration: duration ?? Duration(seconds: 1),
        tween: Tween(begin: 1.0, end: endNum),
        builder: (BuildContext context, double value, Widget child) {
          final a = value ~/ 1;
          final b = value - a;
          return Stack(
            children: <Widget>[
              Positioned(
                top: b * -100, //0->-100
                child: Opacity(
                  opacity: 1 - b,
                  child: Text(
                    '$a',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ),
              Positioned(
                top: 100 - (b * 100), //100-0
                child: Opacity(
                  opacity: b,
                  child: Text(
                    '${a + 1}',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

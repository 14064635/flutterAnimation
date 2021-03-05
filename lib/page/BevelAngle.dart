import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://www.wolframalpha.com/input/?i=2x%5E2%3D%28w-sqrt%282%29h%29%5E2%2Csolve+for+x
//* 2x^2=(w-sqrt(2)h)^2,solve for x

class BevelAngleTest extends StatefulWidget {
  @override
  _BevelAngleTestState createState() => _BevelAngleTestState();
}

class _BevelAngleTestState extends State<BevelAngleTest> {
  var st = 4;
  var str = 'a';
  Timer timer;
  var ver = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('22');
    timer = Timer.periodic(Duration(milliseconds: 100), (t) {
      timer = t;
      setState(() {
        if (!ver) {
          str += '福';
        } else {
          str = str.substring(0, str.length - 1);
        }

        if (str.length > 30) {
          ver = true;
        }
        if (str.length == 1) {
          ver = false;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double h = 44, w = 500;
    final textSpan = TextSpan(text: '$str', style: TextStyle(fontSize: 15,color: Colors.red));
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr)
      ..layout();
    h = tp.height;
    w = tp.width * 1.5;
    return Scaffold(
      appBar: AppBar(
        title: Text('斜角布局'),
      ),

      body: Center(
        child: ClipRect(
          child: Stack(
            children: <Widget>[
              // Text(str),
              Container(
                width: 220,
                height: 220,
                color: Colors.deepOrange,
              ),
              Positioned(
                left: 0,
                key: UniqueKey(),
                top: sqrt(h * h - sqrt2 * w * h + w * w / 2),
                child: Transform.rotate(
                  alignment: Alignment.bottomLeft,
                  angle: -1 * pi / 4,
                  // angle: pi*2 *1.333,
                  child: Container(
                    color: Colors.yellow.withOpacity(0.5),
                    width: w,
                    height: h,
                    child: Center(child: Text.rich(textSpan)),
                  ),
                ),
              ),
              Positioned(
                right:
                    0, //flutter stack 默认是会裁边的，如果right设置成为0他会认为不需要裁边也就不会把这一层单独分到需要裁边的层，这是因为这个地方并没有考虑旋转的情况，为了触发他的裁边机制所以设置会-0.01
                key: UniqueKey(),
                child: Transform.rotate(
                  alignment: Alignment.bottomRight,
                  angle: pi / st,
                  child: Container(
                    color: Colors.yellow.withOpacity(0.8),
                    width: w,
                    height: h,
                    child: Center(child: Text.rich(textSpan)),
                  ),
                ),
                top: sqrt(h * h - sqrt2 * w * h + w * w / 2),
              ),
              Positioned(
                right:
                    0.01, //flutter stack 默认是会裁边的，如果right设置成为0他会认为不需要裁边也就不会把这一层单独分到需要裁边的层，这是因为这个地方并没有考虑旋转的情况，为了触发他的裁边机制所以设置会-0.01
                key: UniqueKey(),
                top: 220 - h - sqrt(h * h - sqrt2 * w * h + w * w / 2),
                child: Transform.rotate(
                  alignment: Alignment.topRight,
                  angle: -1 * pi / st,
                  child: Container(
                    color: Colors.yellow.withOpacity(0.8),
                    width: w,
                    height: h,
                    child: Center(child: Text.rich(textSpan)),
                  ),
                ),
              ),
              Positioned(
                left:
                    0, //flutter stack 默认是会裁边的，如果right设置成为0他会认为不需要裁边也就不会把这一层单独分到需要裁边的层，这是因为这个地方并没有考虑旋转的情况，为了触发他的裁边机制所以设置会-0.01
                key: UniqueKey(),
                top: 220 - h - sqrt(h * h - sqrt2 * w * h + w * w / 2),
                child: Transform.rotate(
                  alignment: Alignment.topLeft,
                  angle: pi / st,
                  child: Container(
                    color: Colors.yellow.withOpacity(0.8),
                    width: w,
                    height: h,
                    child: Center(child: Text.rich(textSpan)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // body: Center(
      //   child: Stack(
      //     children: <Widget>[
      //       Container(
      //         width: 320,
      //         height: 320,
      //         color: Colors.green,
      //       ),
      //       Positioned(
      //         right:
      //             -0.01, //flutter stack 默认是会裁边的，如果right设置成为0他会认为不需要裁边也就不会把这一层单独分到需要裁边的层，这是因为这个地方并没有考虑旋转的情况，为了触发他的裁边机制所以设置会-0.01
      //         key: UniqueKey(),
      //         child: Transform.rotate(
      //           alignment: Alignment.bottomRight,
      //           angle: pi / st,
      //           child: Container(
      //             color: Colors.red.withOpacity(0.8),
      //             width: w,
      //             height: h,
      //             child: Center(child: Text.rich(textSpan)),
      //           ),
      //         ),
      //         top: sqrt(h * h - sqrt2 * w * h + w * w / 2),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

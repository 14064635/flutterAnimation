import 'package:flutter/cupertino.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimationFlare extends StatefulWidget {
  @override
  _AnimationFlareState createState() => _AnimationFlareState();
}

class _AnimationFlareState extends State<AnimationFlare> {
  var _animationName = 'switch_day';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flare'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text('123'),
            ),
            Container(
              color: Colors.red,
              child: Text('123'),
            ),
            AnimatedContainer(
              width: 200,
              height: 100,
              color:
                  _animationName == 'switch_day' ? Colors.white : Colors.black,
              duration: Duration(seconds: 1),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_animationName == 'switch_night') {
                      _animationName = 'switch_day';
                    } else {
                      _animationName = 'switch_night';
                    }
                  });
                },
                child: Container(
                  child: FlareActor(
                    "assets/switch_daytime.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "$_animationName",
                    callback: (name) {
                      if (name == 'switch_day') {
                        name = 'switch_day';
                      } else {
                        name = 'switch_night';
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

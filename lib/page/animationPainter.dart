import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animation/painter/back_ground_start.dart';

class AnimationPainter extends StatefulWidget {
  @override
  _AnimationPainterState createState() => _AnimationPainterState();
}

class _AnimationPainterState extends State<AnimationPainter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('123')),
      body: BackGroundStart(),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

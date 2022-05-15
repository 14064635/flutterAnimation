import 'dart:math';

import 'package:flutter/material.dart';

/**
 *
 *
 * */
class Effict3D extends StatefulWidget {
  const Effict3D({Key key}) : super(key: key);

  @override
  _Effict3DState createState() => _Effict3DState();
}

class _Effict3DState extends State<Effict3D> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() => _offset += details.delta);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('2222'),
        ),
        body: Center(
          child: Stack(
            children: [

              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_offset.dy * pi / 180)
                  ..rotateY(_offset.dx * pi / 180),
                alignment: Alignment.center,
                child: Cube(
                  key: ValueKey('1'),
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(2, 0, 0.000005)
                  ..rotateX(_offset.dx *pi / 180)
                  ..rotateY(_offset.dy *pi / 180),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cube extends StatelessWidget {
  const Cube({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
        ),
        // Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 2, 0.001)
        //     ..rotateX(-pi / 2)
        //     ..rotateY(10*pi / 2),
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.black,
        //   ),
        // ),
        // Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 2, 0.001)
        //     ..rotateY(pi /4),
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.brown,
        //   ),
        // ),
      ],
    );
  }
}

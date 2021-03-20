import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShaderMaskTest extends StatefulWidget {
  @override
  _ShaderMaskTestState createState() => _ShaderMaskTestState();
}

class _ShaderMaskTestState extends State<ShaderMaskTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      // body: Container(
      //   child: SingChildRenderBox(child: Text('123')),
      // ),
      body: Container(
        color:Colors.red,
        child: Text(
          'Hi~~~王叔永远不秃，B站永远第一.',
          style: TextStyle(
            fontSize: 50,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.0
              ..color = Colors.blue,
          ),
        ),
      ),
    );
  }
}

class SingChildRenderBox extends SingleChildRenderObjectWidget {
  SingChildRenderBox({Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RendexTextBox();
  }
}

class RendexTextBox extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    // child.paint(context, offset+Offset(20,20));
    // child.paint(context, offset.scale(1.5, 1.5));
    // child.paint(context, offset.scale(1, 1));
    var paint = Paint();
    paint.color = Colors.red;
    paint.strokeCap = StrokeCap.round;
    paint.isAntiAlias = true;
    paint.strokeWidth = 1.0; //画笔的
    child.paint(context, offset);
    // context.canvas.drawCircle(new Offset(200, 200), 100, paint);
    // context.canvas.d
  }
}

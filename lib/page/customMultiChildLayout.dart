import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//flutter 布局约束是向下传递约束向上传递尺寸
class CustomMultichildLayoutTest extends StatefulWidget {
  @override
  _CustomMultichildLayoutTestState createState() =>
      _CustomMultichildLayoutTestState();
}

class _CustomMultichildLayoutTestState
    extends State<CustomMultichildLayoutTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CustomMultichildLayout'),
        ),
        body: Stack(
          children: <Widget>[
            CustomMultiChildLayout(
              delegate: myDelegate(),
              children: <Widget>[
                LayoutId(
                  id: 3,
                  child: Container(
                      width: 1000,
                      height: 1400,
                      color: Colors.deepPurple,
                      child: FlutterLogo()),
                ),
                LayoutId(
                  id: 2,
                  child: Container(color: Colors.yellow, child: FlutterLogo()),
                ),
                LayoutId(
                  id: 1,
                  child: Container(color: Colors.red, child: FlutterLogo()),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: CustomMultiChildLayout(
                delegate: textDelegate(),
                children: <Widget>[
                  LayoutId(
                    id: 'text',
                    child: Text('大家好dddsdsdsdsdsds'),
                  ),
                  LayoutId(
                    id: 'underLine',
                    child: Container(
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

// 文本的约束
class textDelegate extends MultiChildLayoutDelegate {
  Size size1, size2;

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(200, 20);
  }

  @override
  void performLayout(Size size) {
    if (hasChild('text')) {
      size1 = layoutChild('text', BoxConstraints.loose(size));
      positionChild('text', Offset(0, 0));
    }

    if (hasChild('underLine')) {
      size2 = layoutChild(
          'underLine', BoxConstraints(maxWidth: size1.width, maxHeight: 2));
      positionChild('underLine', Offset(0, size1.height));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}

class myDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    print('size:${size}');
    var size1, size2, size3;
    if (hasChild(1)) {
      size1 = layoutChild(
        1,
        BoxConstraints(
            minWidth: 100, minHeight: 100, maxHeight: 100, maxWidth: 100),
      );

      positionChild(1, Offset(0, 0));
    }

    if (hasChild(2)) {
      size2 = layoutChild(
        2,
        BoxConstraints.tight(
          Size(200, 200),
        ),
      );

      positionChild(2, Offset(0, 0));
    }

    if (hasChild(3)) {
      size3 = layoutChild(
        3,
        BoxConstraints.loose(size),
      );
      positionChild(3, Offset(0, 0));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}

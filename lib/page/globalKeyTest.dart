import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalKeyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKeyTest'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 100,
            top: 0,
            child: FlatButton(
              key: globalKey,
              onPressed: () {
                RenderBox renderBox =
                    globalKey.currentContext.findRenderObject();
                print(
                    'W:${globalKey.currentContext.size.height}H:${globalKey.currentContext.size.width}');
                print(
                    'x:${renderBox.localToGlobal(Offset.zero).dx}y:${renderBox.localToGlobal(Offset.zero).dy}');
              },
              child: Text("扁平按钮"),
              color: Colors.blue,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}

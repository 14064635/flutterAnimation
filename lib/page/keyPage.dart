import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyPage extends StatefulWidget {
  @override
  _KeyPageState createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  final GlobalKey _localKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试Key'),
      ),
      body: Container(
        color:Colors.black,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0,top: 10.0),
              child: BoxWidget(_localKey),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var rendeBox =
                (_localKey.currentContext.findRenderObject() as RenderBox);
            print('rendeBox.size.width${rendeBox.size.width}');
            print('rendeBox.size.height${rendeBox.size.height}');
            print('rendeBox.size.Offset${rendeBox.localToGlobal(Offset.zero)}');
            (_localKey.currentState as _BoxWidgetState)._count++;
          });
        },
        child: Container(
          child: Text('按钮'),
        ),
      ),
    );
  }
}

class BoxWidget extends StatefulWidget {
  BoxWidget([Key key]) : super(key: key);
  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.green,
      child: Text('文本$_count'),
    );
  }
}

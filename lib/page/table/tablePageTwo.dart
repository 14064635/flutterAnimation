import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TablePageTwo extends StatefulWidget {
  MaterialColor myColor;
  String keyName;
  TablePageTwo({this.myColor, this.keyName});
  @override
  _TablePageTweoState createState() => _TablePageTweoState();
}

class _TablePageTweoState extends State<TablePageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey(widget.keyName),
      itemBuilder: (BuildContext context, int index) => Container(
        height: 20,
        color: widget.myColor[index % 9 * 100],
        child: Text('$index'),
      ),
      itemCount: 100,
    );
  }
}

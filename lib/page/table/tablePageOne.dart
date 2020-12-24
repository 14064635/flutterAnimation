import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TablePageOne extends StatefulWidget {
  MaterialColor myColor;
  String keyName;
  TablePageOne({this.myColor, this.keyName});
  @override
  _TablePageOneState createState() => _TablePageOneState();
}

class _TablePageOneState extends State<TablePageOne>  {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey(widget.keyName),
      itemBuilder: (BuildContext context, int index) => Container(
        height: 20,
        color: widget.myColor[index % 9 * 100],
        child: Text('$index'),
      ),
      itemCount: 200,
    );
  }

}

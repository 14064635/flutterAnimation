import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///课滑动删除的
class DismissiblePage extends StatefulWidget {
  @override
  _DismissibleState createState() => _DismissibleState();
}

class _DismissibleState extends State<DismissiblePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('出结果'),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: 200,
        itemBuilder: (_, index) {
          return Dismissible(
              background: Container(
                width: 50,
                color: Colors.red,
                child: Text('删除'),
              ),
              secondaryBackground: Container(
                alignment: Alignment.topRight,
                color: Colors.yellow,
                child: Text('Sencond'),
              ),
              confirmDismiss: (direction) {},
              onResize: () {},
              onDismissed: (event) {
                print(event);
              },
              key: UniqueKey(),
              child:
                  Container(height: 30, color: Colors.blue[index % 9 * 100]));
        },
      )),
    );
  }
}

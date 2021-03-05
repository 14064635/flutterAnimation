import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BevelAbgle extends StatefulWidget {
  final List<Widget> myChildren;
  BevelAbgle(this.myChildren);
  @override
  _BevelAbgleState createState() => _BevelAbgleState();
}

class _BevelAbgleState extends State<BevelAbgle> {
  final List<GlobalKey> globalKeys = [];
  final List<Widget> showChildren = [];
  bool show = false;
  List<Widget> getCustomChildren() {
    List<Widget> myChildren = [];
    for (var j = 0; j < widget.myChildren.length; j++) {
      var globalKey = GlobalKey();
      globalKeys.add(globalKey);
      myChildren.add(
        Row(
          key: globalKey,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[widget.myChildren[j]],
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateWeight();
      setState(() {
        show = true;
      });
    });
    return myChildren;
  }

  void updateWeight() {
    var widgetW = 0.0;
    var widgetH = 0.0;
    for (var i = 0; i < widget.myChildren.length; i++) {
      if (i > 0) {
        widgetW = widgetW + globalKeys[i - 1].currentContext.size.width;
        widgetH = widgetH + globalKeys[i - 1].currentContext.size.height;
      }
      showChildren.add(Positioned(
        left: widgetW,
        top: widgetH,
        child: widget.myChildren[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        child: Stack(
          children: !show ? getCustomChildren() : showChildren,
        ),
      ),
    );
  }
}

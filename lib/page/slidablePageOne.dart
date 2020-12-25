import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'flutterSlidable.dart';

///右滑菜单显示
class SlidablePageOne extends StatefulWidget {

  String keyValue;
  ScrollController  controller;

  SlidablePageOne({this.controller,this.keyValue});


  @override
  _SlidablePageOneState createState() => _SlidablePageOneState();
}

class _SlidablePageOneState extends State<SlidablePageOne> {
  var list;
  SlidableController slidableController;
  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;
  @override
  void initState() {
    // TODO: implement initState
    list = List.generate(100, (index) => index);
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    super.initState();
  }

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: PageStorageKey(widget.keyValue),
      child: ListView.builder(
//        controller: widget.controller,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return itemBuild(context, index);
          }),
    );
  }

  Widget itemBuild(BuildContext context, int index) {
    var a = list[index];
    return Slidable.builder(
      key: Key('$a'),
      actionPane: SlidableScrollActionPane(), //滑出选项的面板 动画
      actionExtentRatio: 0.25,
      child: ListItem(title: '你们好$a'),
      dismissal: SlidableDismissal(
        closeOnCanceled: true,
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          setState(() {
            list.removeAt(index);
          });
        },
      ),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
                closeOnTap: true, //点击后关闭右滑菜单
                onTap: () async {
                  var state = Slidable.of(context);
                  var dismiss = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        content: Text('Item will be deleted'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      );
                    },
                  );
                  if (dismiss) {
                    state.dismiss();
                  }
//                  print('123');
//                  var state = Slidable.of(context);
//                  state.dismiss();
                },
              );
            } else {
              return IconSlideAction(
                caption: 'Share',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.indigo.withOpacity(animation.value)
                    : Colors.indigo,
                icon: Icons.share,
                onTap: () => _showSnackBar(context, 'Share'),
              );
            }
          }),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

import 'package:flutter/material.dart';

import 'InheritedProVider.dart';
import 'MyChangeNotifier.dart';


class ChangeNotifierProvider<T extends MyChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context) {
    // final type = typeOf<InheritedProVider<T>>();
    final provider =  context.dependOnInheritedWidgetOfExactType<InheritedProVider<T>>();
    return provider.data;
  }

  @override
  ChangeNotifierProviderState<T> createState() => ChangeNotifierProviderState<T>();
}

class ChangeNotifierProviderState<T extends MyChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProVider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
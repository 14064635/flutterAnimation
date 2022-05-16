import 'package:flutter/cupertino.dart';


// 一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProVider<T>  extends InheritedWidget {
  final T data;
  const InheritedProVider({@required this.data,@required Widget child}) : super(child: child);

  ///
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`
    return true;
  }
}

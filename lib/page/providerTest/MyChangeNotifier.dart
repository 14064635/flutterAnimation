import 'package:flutter/cupertino.dart';

class MyChangeNotifier implements Listenable {
  List listeners = [];
  //添加监听器
  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  //移除监听器
  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

  void notifyListeners() {
    listeners.forEach((element) => element());
  }
}

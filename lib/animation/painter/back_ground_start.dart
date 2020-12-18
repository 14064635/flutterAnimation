import 'dart:ui' as ui;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'bobble_bean.dart';
import 'custom_my_painter.dart';

class BackGroundStart extends StatefulWidget {
  static int countAnimation = 0;

  @override
  _BackgroudStartState createState() => _BackgroudStartState();
  const BackGroundStart();
}

class _BackgroudStartState extends State<BackGroundStart>
    with TickerProviderStateMixin {
  //...保存的数据对象集
  final List<BobbleBean> _list = [];
  //随机数
  final Random _random = Random(DateTime.now().microsecondsSinceEpoch);
  //来个动画控制器
  AnimationController _animationController;
//  ui.Image _image;
  List<ui.Image> imageList = [];
  @override
  void initState() {
    super.initState();
      _loadImage('assets/xigua.png').then((res) {
        imageList.add(res);
      });
      _loadImage('assets/xigua.png').then((res) {
        imageList.add(res);
      });
      _loadImage('assets/xigua.png').then((res) {
        imageList.add(res);
      });

    Future.delayed(Duration(seconds: 1), initData);

    //创建动画控制器 1秒
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    //执行刷新监听
    _animationController.addListener(() {
      setState(() {});
    });
    //开启气泡的运动
    _animationController.repeat(
        min: 1, max: 1, reverse: true, period: Duration(seconds: 2));
  }

  /// 加载图片
  Future<ui.Image> _loadImage(String path) async {
    var data = await rootBundle.load(path);
    var codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    var info = await codec.getNextFrame();

    return info.image;
  }

  void initData() {
    for (int i = 0; i < 10; i++) {
      BobbleBean bean = BobbleBean();
      //设置位置 先来个默认的 绘制的时候再修改
      double x = _random.nextDouble() * MediaQuery.of(context).size.width * 3;
      double z = _random.nextDouble() + 0.5;
      bean.speed = _random.nextDouble() + 4 / z;
      bean.postion = Offset(x, 10000);
      bean.origin = Offset(x, 0);
      bean.rotate = _random.nextDouble() * 2;
      int d = _random.nextInt(3);
      if (i % 2 == 0) {
        bean.initX = (d * -1).toDouble();
      } else {
        bean.initX = (d * 1).toDouble();
      }
      bean.offsetY = _random.nextInt(1000).toDouble();
      bean.index = _random.nextInt(3);
      _list.add(bean);
    }
  }

  @override
  void dispose() {
    BackGroundStart.countAnimation = 0;
    _animationController?.removeListener(() {});
    _animationController?.stop();
    _animationController?.dispose();
    _list.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: false,
      child: Center(
        child: CustomPaint(
          size: MediaQuery.of(context).size,
          //画布
          painter: CustomMyPainter(
              list: _list, random: _random, imageList: imageList),
        ),
      ),
    );
  }
}

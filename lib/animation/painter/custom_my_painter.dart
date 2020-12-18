import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'back_ground_start.dart';
import 'bobble_bean.dart';
import 'dart:ui' as ui;

///创建画布
class CustomMyPainter extends CustomPainter {
  List<BobbleBean> list;
  Random random;
  //画笔
  Paint _paint = new Paint()..isAntiAlias = true;
  List<ui.Image> imageList = [];
//  ui.Image image;
  CustomMyPainter({this.list, this.random, this.imageList});
  @override
  void paint(Canvas canvas, Size size) {
    // 在绘制前重新计算每个点的位置
    list.forEach((element) {
      //左右微抖动
      double dx = element.initX;
      //竖直方向位置偏移
      double dy = element.speed;
      //位置偏移量计算
      element.postion += Offset(dx, dy);
      //重置位置
      if (element.postion.dy > (size.height * 3) + 1000) {
        BackGroundStart.countAnimation++;
        element.postion = element.origin;
      }
    });
    //
    // //绘制
    list.forEach((element) {
      canvas.save();
      canvas.scale(0.1, 0.1);
      //绘制圆
      canvas.drawImage(
          imageList[element.index],
          Offset(element.postion.dx, element.postion.dy - element.offsetY),
          _paint);
      canvas.restore();
    });
  }

  //刷新 控制
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //返回false 不刷新
    return true;
  }
}

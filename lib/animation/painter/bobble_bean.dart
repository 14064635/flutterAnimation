import 'dart:ui';

///定义 模型 用来保存基本属性信息
class BobbleBean {
  //位置
  Offset postion;
  //初始位置
  Offset origin;
  //运动的速度
  double speed;
  int index;
  //初始化X坐标
  double initX;
  //Y轴的偏移量
  double offsetY;
  double rotate;
}
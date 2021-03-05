import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeSizeButton extends StatefulWidget {
  @override
  _ChangeSizeButtonState createState() => _ChangeSizeButtonState();
}

class _ChangeSizeButtonState extends State<ChangeSizeButton>
    with SingleTickerProviderStateMixin {
  bool showIcon = false;
  Widget myWidget;
  double widthC = 100;
  @override
  void initState() {super.initState();getButtonWidget();}void getButtonWidget() {showIcon = !showIcon;if (showIcon) {widthC = 60;myWidget = Center(key: UniqueKey(), child: Container(width: 60, height: 60, child: Icon(Icons.arrow_forward, color: Colors.white),),);} else {widthC = 200;myWidget = Center(key: UniqueKey(), child: Text("收藏", style: TextStyle(color: Colors.white),),);}setState(() {});}
  @override
  Widget build(BuildContext context) {return Scaffold(appBar: AppBar(title: Text('Button测试'),), body: Center(child: Container(height: 60, child: AnimatedContainer(width: widthC, duration: Duration(seconds: 1), child: RaisedButton(onPressed: () {getButtonWidget();}, child: AnimatedSwitcher(duration: Duration(seconds: 1), child: myWidget), color: Colors.deepPurple, textColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350)),),),),),);}}

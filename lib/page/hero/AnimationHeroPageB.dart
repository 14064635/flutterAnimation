import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationHeroPageB extends StatefulWidget {
  @override
  _AnimationHeroPageBState createState() => _AnimationHeroPageBState();
}

class _AnimationHeroPageBState extends State<AnimationHeroPageB> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.green,
        child: Hero(
          tag: '123',
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608203323341&di=ca67b7f7e8d81cc6c7e0814260c6d167&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F86%2F10%2F01300000184180121920108394217.jpg',
            width: 400,
            height: 400,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AnimationHeroPageB.dart';

class AnimationHeroPageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页1'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return AnimationHeroPageB();
          }));
        },
        child: Container(
          child: Hero(
            tag: "123",
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608203323341&di=ca67b7f7e8d81cc6c7e0814260c6d167&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F86%2F10%2F01300000184180121920108394217.jpg',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

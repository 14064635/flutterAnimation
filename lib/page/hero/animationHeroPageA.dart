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
              'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1694681277,1453280371&fm=26&gp=0.jpg',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

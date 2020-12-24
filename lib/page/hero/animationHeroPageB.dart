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
            'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1694681277,1453280371&fm=26&gp=0.jpg',
            width: 400,
            height: 400,
          ),
        ),
      ),
    );
  }
}

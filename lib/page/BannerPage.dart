import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: ClipRect(
          child: Banner(
            message: 'krcm110',
            location: BannerLocation.topEnd,
          ),
        ),
      ),
    );
  }
}
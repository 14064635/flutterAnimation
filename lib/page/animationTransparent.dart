import 'package:flutter/cupertino.dart';

class AnimationTransparent extends StatefulWidget {
  @override
  _AnimationTransparentState createState() => _AnimationTransparentState();
}

class _AnimationTransparentState extends State<AnimationTransparent> {
  int _completeCount = 0;
  var _index = 0;
  var _opacity = 1.0;
  var _list = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2853553659,1775735885&fm=26&gp=0.jpg'
  ];
  var _showImageUrl =
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg';
  int _getImageIndex() {
    _index++;
    if (_index >= _list.length) {
      _index = 0;
    }
    return _index;
  }

  void _getImageUrl() {
    _showImageUrl = _list[_getImageIndex()];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: _opacity,
          onEnd: () {
            setState(() {
              _opacity = 1;
            });
            _completeCount++;
            if (_completeCount % 2 != 0) {
              _getImageUrl();
            }
          },
          child: GestureDetector(
            onTap: () {
              if (_completeCount % 2 == 0) {
                _completeCount = 0;
                setState(() {
                  _opacity = 0.0;
                });
              }
            },
            child: Image.network(
              _showImageUrl,
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}

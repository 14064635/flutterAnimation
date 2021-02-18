import 'package:flutter/cupertino.dart';

class DiagonalWidget extends StatefulWidget {
  final List<Widget> children;
  DiagonalWidget(this.children);
  @override
  _DiagonalWidgetState createState() => _DiagonalWidgetState();
}

class _DiagonalWidgetState extends State<DiagonalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.children.length; i++)
          Row(
            children: widget.children.sublist(0, i + 1).asMap().keys.map((e) {
              return Opacity(
                  opacity: e == i ? 1.0 : 1.0, child: widget.children[e]);
            }).toList(),
          )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/page/table/tablePageTwo.dart';

class HeadAnimationPage extends StatefulWidget {

  @override
  _HeadAnimationPageState createState() => _HeadAnimationPageState();
}

class _HeadAnimationPageState extends State<HeadAnimationPage>
    with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  var control;
  @override
  void initState() {

    super.initState();
    control = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: sliverWidget,
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: TabBarView(key: ValueKey('11'), controller: control, children: [
          TablePageTwo(
            keyName: '1',
            myColor: Colors.red,
          ),
          TablePageTwo(
            keyName: '2',
            myColor: Colors.green,
          ),
        ]),
      ),
    ));
  }

  List<Widget> sliverWidget(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        actions: <Widget>[
          //右侧控件
//            Center(
//              child: Container(
//                child: Text('你好'),
//              ),
//            ),
//            Center(
//              child: Container(
//                child: Text('你好'),
//              ),
//            ),
        ],
//          title: Center(
//              child: Container(
//            child: Text('标题'),
//          )), //标题，通常为Text控件
        backgroundColor: Colors.green,
        expandedHeight: 300.0, //展开区域的高度
//          floating:
//              false, //设置为true时，向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现|
        pinned: true, //将始终渲染一个固定在顶部的收起状态
//          snap: false,//设置为true时，当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态，此效果在floating=true时生效|
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(top: 15),
          title: Center(child: Text('复仇者')),
          //展开和折叠区域
          background: Container(
            child: Stack(
              children: <Widget>[Positioned(top: 150, child: Text('1233'))],
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              image: DecorationImage(
                image: ExactAssetImage('assets/bg_time_bg_dashijibei.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          centerTitle: true,
        ),
        onStretchTrigger: () {
          print('222222222222');
        },
        // floating: floating,
        // snap: snap,
        // pinned: pinned,
      ),
      SliverPersistentHeader(
        pinned: true, //固定在顶部
        delegate: _SliverAppBarDelegate(
          TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.cake), text: '左侧1'),
              Tab(icon: Icon(Icons.golf_course), text: '右侧1'),
            ],
            controller: control,
          ),
        ),
      ),
    ];
  }

  @override
  bool get wantKeepAlive => true;
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

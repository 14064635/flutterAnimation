import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/page/table/tablePageTwo.dart';

/// 个人中心页面
class CenterHomePage extends StatefulWidget {
  @override
  _CenterHomePageState createState() => _CenterHomePageState();
}

class _CenterHomePageState extends State<CenterHomePage>
    with TickerProviderStateMixin {
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
        expandedHeight: 400.0, //展开区域的高度
          floating:
              true, //设置为true时，向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现|
        pinned: true, //将始终渲染一个固定在顶部的收起状态
          snap: true,//设置为true时，当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态，此效果在floating=true时生效|
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          titlePadding: EdgeInsets.only(top: 15),
          //展开和折叠区域
//          background: Container(
//            child: Stack(
//              children: <Widget>[Positioned(top: 150, child: Text('1233'))],
//            ),
//            decoration: BoxDecoration(
//              color: Colors.deepPurple,
//              image: DecorationImage(
//                image: ExactAssetImage('assets/bg_time_bg_dashijibei.png'),
//                fit: BoxFit.fill,
//              ),
//            ),
//          ),
          background: Container(
            child: statWidget(),
          ),
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

  Widget statWidget() {
    return Stack(children: <Widget>[
      Image.network(
        'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2631334549,246605465&fm=26&gp=0.jpg',
        fit: BoxFit.cover,
        height: 430,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 82, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: NetworkImage(
                      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fs9.sinaimg.cn%2Fbmiddle%2F5ceba31bg5d6503750788&refer=http%3A%2F%2Fs9.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611305955&t=648a34ee68ab2188aa65a793882e2c82",
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        shape: StadiumBorder(),
                        child: Text(
                          "  编辑个人资料  ",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color.fromARGB(50, 255, 255, 255),
                        elevation: 0,
                        onPressed: () {},
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        color: Color.fromARGB(50, 255, 255, 255),
                        elevation: 0,
                        onPressed: () {},
                      ),
                    ],
                  )
                ]),
            SizedBox(
              height: 20,
            ),
            Text('你好', style: TextStyle(fontSize: 25, color: Colors.white)),
            SizedBox(
              height: 15,
            ),
            Text(
              "user_mail@mail.mail",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "这里是个人签名。这里是个人签名。这里是个人签名。",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              "这里是个人签名。这里是个人签名。这里是个人签名。",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              "这里是个人签名。这里是个人签名。这里是个人签名。",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),

    ]);
  }
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

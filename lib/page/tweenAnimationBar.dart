// import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation/page/component/nested_scroll_view_refresh_indicator.dart'
    as refresh;
import 'package:flutter_animation/page/slidablePageOne.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'SlidablePageTwo.dart';

class TwennAnimationBar extends StatefulWidget {
  @override
  _twennAnimationBarState createState() => _twennAnimationBarState();
}

class _twennAnimationBarState extends State<TwennAnimationBar>
    with TickerProviderStateMixin {
  var list;
  TabController _tableControl;
  SlidableController slidableController;

  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;
  ScrollController _scrollController = ScrollController();
  var toolbarOpacity = 0.0;
  double _offsetY = 0.0;
  @override
  void initState() {
    super.initState();
    _tableControl = TabController(length: 2, vsync: this);
    list = List.generate(100, (index) => index);
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    _scrollController.addListener(() {
      _offsetY = _scrollController.offset;
      double t = _scrollController.offset / 200;
      if (t < 0.0) {
        t = 0.0;
      } else if (t > 1.0) {
        t = 1.0;
      }
      setState(() {
        toolbarOpacity = t;
      });
      print('_scrollController.offset:${_scrollController.offset}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _offsetY > 148
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Scaffold(
        body: refresh.NestedScrollViewRefreshIndicator(
          navBar: Opacity(
            opacity: _offsetY / 148 > 1 ? 1 : _offsetY / 148,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(left: 5, top: 15),
                height: 80,
                color: Colors.red,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        color: Color.fromARGB(50, 255, 255, 255),
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fs9.sinaimg.cn%2Fbmiddle%2F5ceba31bg5d6503750788&refer=http%3A%2F%2Fs9.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611305955&t=648a34ee68ab2188aa65a793882e2c82",
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'krcm110',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          onRefresh: () {
            _onRefresh(context);
          },
          child: NotificationListener(
            onNotification: (Notification notification) {
              if (notification is ScrollStartNotification) {
                print('滚动开始');
              }
              if (notification is ScrollUpdateNotification) {
                print('滚动中${notification.scrollDelta}');
              }
              if (notification is ScrollEndNotification) {
                print('停止滚动');
                if (_scrollController.position.extentAfter == 0) {
                  print('滚动到底部');
                }
                if (_scrollController.position.extentBefore == 0) {
                  print('滚动到头部');
                  print('滚动到头部');
                }
              }
              if (notification is OverscrollNotification) {
                print('滚动到界边');
              }
            },
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              // child: d.NestedScrollView(
              //   controller: _scrollController,
              //   headerSliverBuilder: sliverWidget,
              //   pinnedHeaderSliverHeightBuilder: () =>
              //       MediaQuery.of(context).padding.top + 100.0,
              //   body: Container(
              //     padding: EdgeInsets.only(top: 10.0),
              //     child: TabBarView(
              //         key: ValueKey('11'),
              //         controller: _tableControl,
              //         children: [
              //           SlidablePageOne(
              //             controller: _scrollController,
              //             keyValue: '1',
              //           ),
              //           SlidablePageTwo(
              //             keyValue: '2',
              //           ),
              //         ]),
              //   ),
              // ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(0.0,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          },
          child: Text('你好'),
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) {
//    MyApp.dataAnalytics.insertEvent(
//      EventType(
//        eventPage: Home.routeName,
//        createdDate: DateTime.now().millisecondsSinceEpoch,
//        eventType: 'ON_REFRESH',
//        extendInfo: {'name': '首页下拉刷新'},
//      ),
//    );
//    final _homeStore = Provider.of<HomeStore>(context);
//    _homeStore.refreshReset();
// //        发请求
//    _homeStore.dataRequestApi(_tabController.index);
//    _homeStore.listenerKey = <int>[_tabController.index];
//    return _homeStore.refreshCompleter.future.then((_) {});
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

  List<Widget> sliverWidget(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverList(
        delegate: SliverChildBuilderDelegate(
            (c, i) => Container(
                  padding: EdgeInsets.only(top: 60),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image:
                          ExactAssetImage('assets/bg_time_bg_dashijibei.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              radius: _offsetY / 65.0 > 65
                                  ? 65.0
                                  : _offsetY / 45.0 + 20,
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
                      //    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                      //    _colors = List.generate(8, (index) => _color[(index + 1) * 100]);
                      //    setState(() => _colors.shuffle());
                      Text('你好',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.primaries[14]
                                  [_offsetY.floor() + 100])),
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
                  )),
                ),
            childCount: 1),
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
            controller: _tableControl,
          ),
        ),
      ),
    ];
  }

  Widget itemBuild(BuildContext context, int index) {
    var a = list[index];
    return Slidable.builder(
      key: Key('$a'),
      actionPane: SlidableScrollActionPane(), //滑出选项的面板 动画
      actionExtentRatio: 0.25,
      child: ListItem(title: '你们好$a'),
      dismissal: SlidableDismissal(
        closeOnCanceled: true,
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          setState(() {
            list.removeAt(index);
          });
        },
      ),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
                closeOnTap: true, //点击后关闭右滑菜单
                onTap: () async {
                  var state = Slidable.of(context);
                  var dismiss = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        content: Text('Item will be deleted'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      );
                    },
                  );
                  if (dismiss) {
                    state.dismiss();
                  }
                },
              );
            } else {
              return IconSlideAction(
                caption: 'Share',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.indigo.withOpacity(animation.value)
                    : Colors.indigo,
                icon: Icons.share,
                onTap: () => _showSnackBar(context, 'Share'),
              );
            }
          }),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class ListItem extends StatelessWidget {
  String title;

  ListItem({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Text('$title'),
    );
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

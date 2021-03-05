import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation/page/AnimationCard.dart';
import 'package:flutter_animation/page/AnimationControlPage.dart';
import 'package:flutter_animation/page/AnimationCountPage.dart';
import 'package:flutter_animation/page/AnimationDevice.dart';
import 'package:flutter_animation/page/AnimationFlare.dart';
import 'package:flutter_animation/page/AnimationPainter.dart';
import 'package:flutter_animation/page/BelevelAnglePage.dart';
import 'package:flutter_animation/page/BevelAngle.dart';
import 'package:flutter_animation/page/KeyPage.dart';
import 'package:flutter_animation/page/animatedCrossFadePage.dart';
import 'package:flutter_animation/page/boxGame.dart';
import 'package:flutter_animation/page/centerHomePage.dart';
import 'package:flutter_animation/page/changeSizeButton.dart';
import 'package:flutter_animation/page/customMultiChildLayout.dart';
import 'package:flutter_animation/page/diagonalWidget.dart';
import 'package:flutter_animation/page/dismissible.dart';
import 'package:flutter_animation/page/flipCardComponent.dart';
import 'package:flutter_animation/page/flutterSlidable.dart';
import 'package:flutter_animation/page/game.dart';
import 'package:flutter_animation/page/globalKeyTest.dart';
import 'package:flutter_animation/page/headAnimationPage.dart';
import 'package:flutter_animation/page/hero/AnimationHeroPageA.dart';
import 'package:flutter_animation/page/keyBordGame.dart';
import 'package:flutter_animation/page/myReorderableListView.dart';
import 'package:flutter_animation/page/tweenAnimationBar.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AnimationHeroPageA();
                    }));
                  },
                  child: Text(
                    'Hero',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AnimationCountPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'AnimationCount',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AnimationControlPage();
                    }));
                  },
                  child: Text(
                    'AnimationControl',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AnimationDevice();
                    }));
                  },
                  child: Text(
                    'AnimationChain',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AnimationFlare();
                    }));
                  },
                  child: Text(
                    'AnimationFlare',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AnimationPainter();
                    }));
                  },
                  child: Text(
                    'AnimationPainter',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return KeyPage();
                    }));
                  },
                  child: Text(
                    'Key',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyReorderableListView();
                    }));
                  },
                  child: Text(
                    'reorderableListView',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return BoxGame();
                    }));
                  },
                  child: Text(
                    'BoxGame',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DismissiblePage();
                    }));
                  },
                  child: Text(
                    'Dismissble',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HeadAnimationPage();
                    }));
                  },
                  child: Text(
                    'SliverAppBar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return CenterHomePage();
                    }));
                  },
                  child: Text(
                    'CenterHomePage',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return FlutterSlidable();
                    }));
                  },
                  child: Text(
                    'flutterSlidableBox',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return TwennAnimationBar();
                    }));
                  },
                  child: Text(
                    'TwennAnimationBar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return KeyBordGame();
                    }));
                  },
                  child: Text(
                    'Ipad',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Game();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'keyBordGame',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AnimatedCrossFadePage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'animatedCrossFadePage',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return AnimationCard();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'FlipCardComponent',
                      style: TextStyle(fontSize: 20),
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FlipCardComponent();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'animationCard',
                      style: TextStyle(fontSize: 20),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return BevelAngleTest();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'bevelAngle',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.blue),
                        Text(
                          "收藏",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return BelevelAnglePage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'bevelColumn1',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return DiagonalWidget([
                            Text("123"),
                            Text('2345'),
                            Image.network(
                              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.51miz.com%2Fpreview%2Felement%2F00%2F01%2F12%2F81%2FE-1128163-9A208FD8.jpg&refer=http%3A%2F%2Fimg.51miz.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616224376&t=4727d929caf37a4d8a5e94fa08d71b8f',
                              width: 100,
                              height: 100,
                            ),
                            Text('888')
                          ]);
                        },
                      ),
                    );
                  },
                  child: Text(
                    'bevelColumn',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChangeSizeButton();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'ChangeButton',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return CustomMultichildLayoutTest();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'CustomMultichildLayoutTest',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return GlobalKeyTest();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'GlobalKeyTest',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

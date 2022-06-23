import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/pages/component/component_page.dart';
import 'dart:io';

import 'package:flutter_demo/pages/splash/splash_widget.dart';

void main() {
  runApp(const MyApp());
  // if (Platform.isAndroid) {
  //   //设置Android头部的状态栏透明
  //   SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(backgroundColor: Colors.white),
            home: const Scaffold(
              body: SplashWidget(),
            )));
  }
}

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartWidget extends StatefulWidget {
  final Widget? child;

  const RestartWidget({Key? key, @required this.child})
      : assert(child != null),
        super(key: key);

  static restartApp(BuildContext context) {
    final RestartWidgetState? state =
        context.findAncestorStateOfType<RestartWidgetState>();
    state?.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}

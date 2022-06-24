import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/pages/tabbar_with_pageview.dart';

class ComponentPageWidget extends StatefulWidget {
  const ComponentPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComponentPageWidgetState();
}

class _ComponentPageWidgetState extends State<ComponentPageWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint("initState ComponentPageWidgetState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4FA),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/ic_component_bg.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: const [
                  TabBarWithPageView()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

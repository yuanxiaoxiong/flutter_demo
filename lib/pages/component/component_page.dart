import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/pages/component/base/base_component.dart';

class ComponentPageWidget extends StatefulWidget {
  const ComponentPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComponentPageWidgetState();
}

class _ComponentPageWidgetState extends State<ComponentPageWidget>
    with SingleTickerProviderStateMixin {
  List tabs = [
    "基础组件",
    "布局组件",
    "表单组件",
    "操作反馈",
    "导航组件",
    "数据组件",
    "扩展组件",
    "画布组件",
    "Dart组件"
  ];

  late List<Widget> views;

  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this);
    //添加监听
    _controller.addListener(() {
      var index = _controller.index;
      var previousIndex = _controller.previousIndex;
      debugPrint("index: $index");
      debugPrint('previousIndex: $previousIndex');
    });
    views = tabs
        .map((e) => BaseComponentView(
              title: e.toString(),
            ))
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: tabs
              .map((e) => Tab(
                    text: e.toString(),
                  ))
              .toList(),
        ),
      ),
      backgroundColor: const Color(0xFFF1F4FA),
      body: TabBarView(
        controller: _controller,
        children: views,
      ),
    );
  }
}

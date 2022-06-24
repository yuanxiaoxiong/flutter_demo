import 'package:flutter/material.dart';

class LayoutPageWidget extends StatefulWidget {
  const LayoutPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF1F4FA),
      body: Center(
        child: Text(
          "布局",
          style: TextStyle(
              fontFamily: "maobi",
              fontSize: 42,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint("LayoutPageState");
  }
}

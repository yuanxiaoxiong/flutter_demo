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
      body: Center(
        child: Text("布局"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint("LayoutPageState");
  }
}

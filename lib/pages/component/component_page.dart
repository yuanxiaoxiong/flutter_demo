import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ComponentPageWidget extends StatefulWidget {
  const ComponentPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComponentPageWidgetState();
}

class _ComponentPageWidgetState extends State<ComponentPageWidget> {
  String _counter = "";

  @override
  void initState() {
    super.initState();
    debugPrint("ComponentPageWidgetState");
  }

  void _updateRep(String res) {
    setState(() {
      _counter = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () async {
          debugPrint("dio---->123456");
          _updateRep("加载中...");
          Response response;
          response = await Dio().get("https://api.dogeshuma.ink/");
          _updateRep(response.data.toString());
          debugPrint("message--->$_counter");
        },
        child: Text(
          '发送网络请求--->$_counter',
          // style: Theme.of(context).textTheme.overline,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TemplatePageWidget extends StatefulWidget {
  const TemplatePageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("模板")),
    );
  }


  @override
  void initState() {
    super.initState();
    debugPrint("TemplatePageState");
  }
}

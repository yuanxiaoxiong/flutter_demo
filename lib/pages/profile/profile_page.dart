import 'package:flutter/material.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("我的")),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint("ProfilePageState");
  }
}

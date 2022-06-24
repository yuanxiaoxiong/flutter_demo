import 'package:flutter/material.dart';

class TabBarWithPageView extends StatefulWidget {
  const TabBarWithPageView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarWithPageViewState();
}

class _TabBarWithPageViewState extends State<TabBarWithPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 210),
      height: 55,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
          color: Colors.white),
    );
  }
}

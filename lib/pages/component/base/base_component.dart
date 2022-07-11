import 'package:flutter/cupertino.dart';

class BaseComponentView extends StatefulWidget {
  const BaseComponentView({Key? key, required String title}) : super(key: key);
  @override
  State<BaseComponentView> createState() => _BaseComponentViewState();
}

class _BaseComponentViewState extends State<BaseComponentView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String title;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('title'),
      ),
    );
  }
}

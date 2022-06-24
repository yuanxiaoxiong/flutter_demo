import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/component/component_page.dart';
import 'package:flutter_demo/pages/layout/layout_page.dart';
import 'package:flutter_demo/pages/profile/profile_page.dart';
import 'package:flutter_demo/pages/template/template_page.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  late List<Widget> pages;

  final defaultItemColor = Colors.white;

  final itemNames = [
    _Item('组件', 'assets/images/ic_tab_component_active.png',
        'assets/images/ic_tab_component_normal.png'),
    _Item('布局', 'assets/images/ic_tab_layout_active.png',
        'assets/images/ic_tab_layout_normal.png'),
    _Item('模板', 'assets/images/ic_tab_template_active.png',
        'assets/images/ic_tab_template_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  late List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    debugPrint('initState _ContainerPageState');
    pages = [
      const ComponentPageWidget(),
      const LayoutPageWidget(),
      const TemplatePageWidget(),
      const ProfilePageWidget(),
    ];
    itemList = itemNames
        .map((item) => BottomNavigationBarItem(
            icon: Image.asset(
              item.normalIcon,
              width: 24.0,
              height: 24.0,
            ),
            label: item.name,
            activeIcon:
                Image.asset(item.activeIcon, width: 24.0, height: 24.0)))
        .toList();
    _selectName = itemNames[0].name;
  }

  int _selectIndex = 0;
  String _selectName = "";

//Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build _ContainerPageState');
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectName),
      ),
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
        ],
      ),
      backgroundColor: const Color(0xff818181),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
            _selectName = itemNames[index].name;
          });
        },
        enableFeedback: true,
        backgroundColor: defaultItemColor,
        unselectedFontSize: 14.0,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: const Color(0xff3c99fe),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

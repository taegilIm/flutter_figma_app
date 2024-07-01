import 'package:flutter/material.dart';
import 'first_page.dart';

void main() {
  runApp(const MainTabWidget());
}

class MainTabWidget extends StatefulWidget {
  const MainTabWidget({super.key});

  @override
  State<MainTabWidget> createState() => _MainTabWidgetState();
}

class _MainTabWidgetState extends State<MainTabWidget>
    with TickerProviderStateMixin {
  late TabController mainTabControl = TabController(length: 5, vsync: this);

  List<Tab> mainTabs = [
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.home_outlined,
        size: 30,
      ),
      text: "메인",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.people_outline,
        size: 30,
      ),
      text: "친구",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.add_box_outlined,
        size: 30,
      ),
      text: "학습",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.search_outlined,
        size: 30,
      ),
      text: "검색",
    ),
    const Tab(
      iconMargin: EdgeInsets.only(bottom: 0),
      icon: Icon(
        Icons.menu_outlined,
        size: 30,
      ),
      text: "메뉴",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TabBarView(
          controller: mainTabControl,
          children: [
            FirstPage(),
            FirstPage(),
            FirstPage(),
            FirstPage(),
            FirstPage(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: mainTabControl,
            tabs: mainTabs,
          ),
        ),
      ),
    );
  }
}

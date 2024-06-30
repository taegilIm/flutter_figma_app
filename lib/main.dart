import 'package:flutter/material.dart';
import 'sub_main.dart';

void main(List<String> args) {
  runApp(const FirstPage());
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
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
        appBar: AppBar(
          toolbarHeight: 80,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Icon(
                  Icons.edit_outlined,
                  size: 30,
                ),
              ),
              const Text(
                "경제 퀴즈",
                style: TextStyle(
                  color: Color(0xFF697077),
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0.06,
                ),
              ),
            ],
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: mainTabControl,
          children: [
            SubMainPage(),
            SubMainPage(),
            SubMainPage(),
            SubMainPage(),
            SubMainPage(),
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

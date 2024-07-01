import 'package:flutter/material.dart';
import 'sub_tabs/tabs.dart';

class SubMainPage extends StatefulWidget {
  const SubMainPage({super.key});

  @override
  State<SubMainPage> createState() => _SubTabsState();
}

class _SubTabsState extends State<SubMainPage> with TickerProviderStateMixin {
  late TabController subTabControl = TabController(length: 5, vsync: this);
  List<Tab> subTabs = [
    const Tab(
      child: Text(
        "점수",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0.06,
          letterSpacing: 0.50,
        ),
      ),
    ),
    Tab(
      child: Row(
        children: [
          const Text(
            "오늘의 학습",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.06,
              letterSpacing: 0.50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2),
            padding: const EdgeInsets.only(left: 5),
            width: 30,
            decoration: ShapeDecoration(
              color: const Color(0xFF697077),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "99+",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
    Tab(
      child: Row(
        children: [
          const Text(
            "분석",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.06,
              letterSpacing: 0.50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2),
            padding: const EdgeInsets.only(left: 5),
            width: 30,
            decoration: ShapeDecoration(
              color: const Color(0xFF697077),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "99+",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
    Tab(
      child: Row(
        children: [
          const Text(
            "소식",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.06,
              letterSpacing: 0.50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2),
            padding: const EdgeInsets.only(left: 5),
            width: 30,
            decoration: ShapeDecoration(
              color: const Color(0xFF697077),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "99+",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
    const Tab(
      child: Text(
        "이벤트",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0.06,
          letterSpacing: 0.50,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFDDE1E6),
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDDE1E6),
          toolbarHeight: 120,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                child: const Text(
                  "DashBoard",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                controller: subTabControl,
                tabs: subTabs,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: subTabControl,
          children: [
            ScoreWidget(),
            QuizWidget(),
            ScoreWidget(),
            ScoreWidget(),
            ScoreWidget(),
          ],
        ),
      ),
    );
  }
}

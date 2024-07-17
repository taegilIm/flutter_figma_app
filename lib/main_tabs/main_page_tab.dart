import 'package:flutter/material.dart';
import 'package:flutter_khackathon/main_tabs/main_quiz_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final _subtabControl = TabController(length: 5, vsync: this);
  final _subTabs = [
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
    const Tab(
      child: Text(
        "오늘의 학습",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0.06,
          letterSpacing: 0.50,
        ),
      ),
    ),
    const Tab(
      child: Text(
        "분석",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0.06,
          letterSpacing: 0.50,
        ),
      ),
    ),
    const Tab(
      child: Text(
        "소식",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0.06,
          letterSpacing: 0.50,
        ),
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

  static const _subpageTabs = [
    ScorePage(),
    SubQuizPage(),
    Placeholder(),
    SearchPage(),
    Placeholder()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: const Text("text"),
          bottom: TabBar(
            controller: _subtabControl,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _subTabs,
          ),
        ),
        body: TabBarView(controller: _subtabControl, children: _subpageTabs),
      ),
    );
  }
}

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Flexible(
          child: Placeholder(),
        ),
        Expanded(
          flex: 8,
          child: ListView(
            children: [
              const Placeholder(),
              const Placeholder(),
            ],
          ),
        ),
      ],
    );
  }
}

class SubQuizPage extends StatefulWidget {
  const SubQuizPage({super.key});

  @override
  State<SubQuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<SubQuizPage> {
  @override
  Widget build(BuildContext context) {
    return const MainQuizPage();
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Flexible(
          child: Placeholder(),
        ),
        Expanded(
          flex: 8,
          child: ListView(
            children: [
              const Placeholder(),
              const Placeholder(),
            ],
          ),
        ),
      ],
    );
  }
}

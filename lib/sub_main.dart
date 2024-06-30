import 'package:flutter/material.dart';

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
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDDE1E6),
          toolbarHeight: 120,
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
            ScoreWidget(),
            ScoreWidget(),
            ScoreWidget(),
            ScoreWidget(),
          ],
        ),
      ),
    );
  }
}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(0.8, 2)),
                  ],
                ),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                height: 48,
                child: Row(
                  children: [
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '시작 날짜',
                            style: TextStyle(
                              color: Color(0xFF697077),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          Icon(
                            Icons.date_range_outlined,
                            color: Color(0xFF697077),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 48,
                      height: double.infinity,
                      color: const Color(0xFFC1C7CD),
                      child: const Icon(Icons.arrow_forward),
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '종료 날짜',
                            style: TextStyle(
                              color: Color(0xFF697077),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          Icon(
                            Icons.date_range_outlined,
                            color: Color(0xFF697077),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.only(left: 16),
                height: 88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(0.8, 2)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "경제 점수",
                      style: TextStyle(
                        color: Color(0xFF697077),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1120",
                          style: TextStyle(
                            color: Color(0xFF21272A),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 28,
                          margin: const EdgeInsets.only(right: 15),
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2F4F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "상위 2.5%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.only(left: 16),
                height: 88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(0.8, 2)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "경제 점수",
                      style: TextStyle(
                        color: Color(0xFF697077),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1120",
                          style: TextStyle(
                            color: Color(0xFF21272A),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 28,
                          margin: const EdgeInsets.only(right: 15),
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2F4F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "상위 2.5%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.only(left: 16),
                height: 88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(0.8, 2)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "경제 점수",
                      style: TextStyle(
                        color: Color(0xFF697077),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1120",
                          style: TextStyle(
                            color: Color(0xFF21272A),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 28,
                          margin: const EdgeInsets.only(right: 15),
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2F4F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "상위 2.5%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.only(left: 16),
                height: 88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(0.8, 2)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "경제 점수",
                      style: TextStyle(
                        color: Color(0xFF697077),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1120",
                          style: TextStyle(
                            color: Color(0xFF21272A),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 28,
                          margin: const EdgeInsets.only(right: 15),
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2F4F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "상위 2.5%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      offset: Offset.fromDirection(0.8, 2),
                    ),
                  ],
                ),
                child: Image.asset("assets/images/for_test.png"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

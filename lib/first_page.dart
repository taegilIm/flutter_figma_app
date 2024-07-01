import 'package:flutter/material.dart';
import 'sub_tab.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
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
        body: const SubMainPage(),
      ),
    );
  }
}

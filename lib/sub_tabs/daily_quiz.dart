import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFFDDE1E6)),
            overlayColor: MaterialStatePropertyAll(Colors.white54),
          ),
        ),
      ),
      home: const QuizContent(),
    );
  }
}

class QuizContent extends StatefulWidget {
  const QuizContent({super.key});

  @override
  State<QuizContent> createState() => _QuizContentState();
}

const int quizCount = 3;

class _QuizContentState extends State<QuizContent> {
  var random = Random();
  int _correctCount = 0;
  int _index = 0;
  int? _selected;
  double _progressBar = 0;

  MaterialStatePropertyAll<Color> _colorA =
      const MaterialStatePropertyAll(Color(0xFFDDE1E6));
  MaterialStatePropertyAll<Color> _colorB =
      const MaterialStatePropertyAll(Color(0xFFDDE1E6));
  MaterialStatePropertyAll<Color> _colorC =
      const MaterialStatePropertyAll(Color(0xFFDDE1E6));

  late List<dynamic> _quizData;

  @override
  void initState() {
    super.initState();
    _jsonParse();
    _index = random.nextInt(quizCount);
  }

  Future _jsonParse() async {
    String data = await rootBundle.loadString("assets/data/quiz.json");
    _quizData = jsonDecode(data);
  }

  void _focusButton() {
    _colorA = const MaterialStatePropertyAll(Color(0xFFDDE1E6));
    _colorB = const MaterialStatePropertyAll(Color(0xFFDDE1E6));
    _colorC = const MaterialStatePropertyAll(Color(0xFFDDE1E6));
    setState(() {
      switch (_selected) {
        case 1:
          _colorA = const MaterialStatePropertyAll(Colors.white);
          break;
        case 2:
          _colorB = const MaterialStatePropertyAll(Colors.white);
          break;
        default:
          _colorC = const MaterialStatePropertyAll(Colors.white);
          break;
      }
    });
  }

  void _nextQuiz() {
    setState(() {
      _selected = null;
      _index = random.nextInt(quizCount);
      _colorA = const MaterialStatePropertyAll(Color(0xFFDDE1E6));
      _colorB = const MaterialStatePropertyAll(Color(0xFFDDE1E6));
      _colorC = const MaterialStatePropertyAll(Color(0xFFDDE1E6));
      if (_correctCount < 5) {
        _correctCount++;
        _progressBar += 0.2;
      } else {
        // 다 풀었을 시 처리
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _jsonParse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              const Text(
                '오늘의 학습',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xFF21272A),
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 35, right: 35, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 9,
                      child: LinearProgressIndicator(
                        minHeight: 10,
                        color: const Color(0xFF31CD63),
                        value: _progressBar,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          '$_correctCount/5',
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF757575),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
                width: double.maxFinite,
                child: Text(
                  'Q1. ${_quizData[_index]['name']}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF191D63),
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _selected = 1;
                          _focusButton();
                        },
                        style: ButtonStyle(
                          backgroundColor: _colorA,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.only(top: 10),
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 60),
                              child: const Text(
                                'A',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF060710),
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '${_quizData[_index]['key'][0]}',
                              style: const TextStyle(
                                color: Color(0xFF060710),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _selected = 2;
                          _focusButton();
                        },
                        style: ButtonStyle(
                          backgroundColor: _colorB,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.only(top: 10),
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 60),
                              child: const Text(
                                'B',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF060710),
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '${_quizData[_index]['key'][1]}',
                              style: const TextStyle(
                                color: Color(0xFF060710),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _selected = 3;
                          _focusButton();
                        },
                        style: ButtonStyle(
                          backgroundColor: _colorC,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.only(top: 10),
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 60),
                              child: const Text(
                                'C',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF060710),
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '${_quizData[_index]['key'][2]}',
                              style: const TextStyle(
                                color: Color(0xFF060710),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(left: 5, right: 5, top: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_quizData[_index]['answer'] == _selected &&
                              _correctCount != 5) {
                            _nextQuiz();
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF747475),
                          ),
                          overlayColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 153, 153, 155),
                          ),
                        ),
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFFEDE8E2),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

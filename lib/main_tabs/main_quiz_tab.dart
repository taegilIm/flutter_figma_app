import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainQuizPage extends StatefulWidget {
  const MainQuizPage({super.key});

  @override
  State<MainQuizPage> createState() => _MainQuizPageState();
}

class QuizInfo {
  String quizName;
  List<String> quizAnswer;
  int quizCorrect;

  QuizInfo(
      {required this.quizName,
      required this.quizAnswer,
      required this.quizCorrect});

  factory QuizInfo.csvParse(List<List<dynamic>> csvData, int index) => QuizInfo(
      quizName: csvData[index][0],
      quizAnswer: [csvData[index][1], csvData[index][2], csvData[index][3]],
      quizCorrect: int.parse(csvData[index][4]));
}

const int quizCount = 5;

class _MainQuizPageState extends State<MainQuizPage> {
  double _progressCount = 0;
  int _correctCount = 0;
  final _maxCount = 5;
  final _random = Random();
  late int _index;

  late QuizInfo _quiz;
  late int _playerCorrect;

  @override
  void initState() {
    super.initState();
    _index = _random.nextInt(quizCount);
    _csvParse();
  }

  Future _csvParse() async {
    String csvString = await rootBundle.loadString("assets/data/quiz.csv");
    List<List<dynamic>> csvData = const CsvToListConverter().convert(csvString);
    _quiz = QuizInfo.csvParse(csvData, _index);
  }

  void _checkCorrect() {
    if (_playerCorrect == _quiz.quizCorrect) {
      setState(() {
        _playerCorrect = 0;
        _index = _random.nextInt(quizCount);
        _progressCount += 0.2;
        _correctCount++;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("failed"),
            content: Icon(Icons.close),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _csvParse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (_correctCount == 5) {
              return const QuizDonePage();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                    child: Text(
                      "text",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: LinearProgressIndicator(
                            value: _progressCount,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '$_correctCount/$_maxCount',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Q${_correctCount + 1}${_quiz.quizName}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextButton(
                            style: const ButtonStyle(
                              alignment: Alignment.centerLeft,
                              minimumSize: MaterialStatePropertyAll(
                                  Size(double.maxFinite, double.maxFinite)),
                            ),
                            onPressed: () {
                              _playerCorrect = 1;
                            },
                            child: Text(
                              _quiz.quizAnswer[0],
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: const ButtonStyle(
                              alignment: Alignment.centerLeft,
                              minimumSize: MaterialStatePropertyAll(
                                  Size(double.maxFinite, double.maxFinite)),
                            ),
                            onPressed: () {
                              _playerCorrect = 2;
                            },
                            child: Text(
                              _quiz.quizAnswer[1],
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: const ButtonStyle(
                              alignment: Alignment.centerLeft,
                              minimumSize: MaterialStatePropertyAll(
                                  Size(double.maxFinite, double.maxFinite)),
                            ),
                            onPressed: () {
                              _playerCorrect = 3;
                            },
                            child: Text(
                              _quiz.quizAnswer[2],
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                          minimumSize: MaterialStatePropertyAll(
                              Size(400, double.maxFinite)),
                        ),
                        onPressed: () => _checkCorrect(),
                        child: const Text(
                          "next",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            // 에러 처리
            return const Dialog(
              child: Text("error"),
            );
          }
        },
      ),
    );
  }
}

class QuizDonePage extends StatelessWidget {
  const QuizDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

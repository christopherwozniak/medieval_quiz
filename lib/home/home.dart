// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Icon> _scoreTracker = [];
  int _questioniIndex = 0;
  int _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medieval History Quiz',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0) const SizedBox(height: 25.0),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin:
                  const EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'This is my questions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Answers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Answers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Answers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Answers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60.0),
              ),
              onPressed: () {},
              child: const Text('Next Question'),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                '0/10',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final _questions = [
  {
    'question': 'Kto był pierwszym królem Polski?',
    'answers': [
      {'answerText': 'Mieszko I', 'score': false},
      {'answerText': 'Kazimierz III Wielki', 'score': false},
      {'answerText': 'Piast Kołodziej', 'score': false},
      {'answerText': 'Bolesław Chrobry', 'score': true},
    ],
  },
  {
    'question': 'Jaki przydomek miał Mieszko II?',
    'answers': [
      {'answerText': 'Lambert', 'score': true},
      {'answerText': 'Groźny', 'score': false},
      {'answerText': 'Szczodry', 'score': false},
      {'answerText': 'Śmiały', 'score': false},
    ],
  },
  {
    'question': 'Który król kazał wybudować Akademię Krakowską?',
    'answers': [
      {'answerText': 'Mieszko I', 'score': false},
      {'answerText': 'Kazimierz III Wielki', 'score': true},
      {'answerText': 'Władysław Jagiełło', 'score': false},
      {'answerText': 'Bolesław Chrobry', 'score': false},
    ],
  },
  {
    'question': 'Kto sprowadził do Polski w 1226 roku Zakon Krzyzacki?',
    'answers': [
      {'answerText': 'Zawisza Czarny', 'score': false},
      {'answerText': 'Ksiązę Janusz', 'score': false},
      {'answerText': 'Kaziemierz Jagiellończyk', 'score': false},
      {'answerText': 'Konrad Mazowiecki', 'score': true},
    ],
  },
];

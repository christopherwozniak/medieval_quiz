import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medieval History Quiz'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
    );
  }
}

final _questions = const [
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

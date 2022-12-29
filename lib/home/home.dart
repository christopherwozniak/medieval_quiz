// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medieval_quiz/answer/answer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questioniIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.clear, color: Colors.red),
      );
      //when the quiz ends
      if (_questioniIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questioniIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    //what happens at the end of the quiz
    if (_questioniIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questioniIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

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
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Row(
                  children: [
                    if (_scoreTracker.isEmpty) const SizedBox(height: 25.0),
                    if (_scoreTracker.isNotEmpty) ..._scoreTracker
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 130.0,
                  margin: const EdgeInsets.only(
                      bottom: 10.0, left: 30.0, right: 30.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      _questions[_questioniIndex]['question'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ...(_questions[_questioniIndex]['answers']
                        as List<Map<String, Object>>)
                    .map(
                  (answer) => Answer(
                    answerText: answer['answerText'].toString(),
                    answerColor: answerWasSelected == answer['score']
                        ? Colors.green
                        : Colors.red,
                    answerTap: () {
                      // if answer was already selected then nothing happens onTap
                      if (answerWasSelected) {
                        return;
                      }
                      //answer is being selected
                      _questionAnswered(answer['score'] as bool);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60.0),
                  ),
                  onPressed: () {
                    if (!answerWasSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please select the answer before you go to the next question'),
                        ),
                      );
                      return;
                    }
                    _nextQuestion();
                  },
                  child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '${_totalScore.toString()}/${_questions.length}',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                if (answerWasSelected && !endOfQuiz)
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: correctAnswerSelected ? Colors.green : Colors.red,
                    child: Center(
                      child: Text(
                        correctAnswerSelected
                            ? 'You got right, well done'
                            : 'Wrong answer...',
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                if (endOfQuiz)
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        _totalScore > 2
                            ? 'Congratulations! Your final score is: $_totalScore'
                            : 'Your final score is: $_totalScore. Better luck next time!',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: _totalScore > 2 ? Colors.green : Colors.red),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ]));
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


// InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(15.0),
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: const Text(
//                   'Answers',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(15.0),
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: const Text(
//                   'Answers',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(15.0),
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: const Text(
//                   'Answers',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(15.0),
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: const Text(
//                   'Answers',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
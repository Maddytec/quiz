import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _answerSelected = 0;
  var _totalGrade = 0;
  final _answers = const [
    {
      'text': 'What is your color favorite?',
      'response': [
        {'text': 'red', 'grade': 6},
        {'text': 'blue', 'grade': 3},
        {'text': 'black', 'grade': 10},
      ]
    },
    {
      'text': 'What is your animal favorite?',
      'response': [
        {'text': 'dog', 'grade': 5},
        {'text': 'cat', 'grade': 8},
        {'text': 'lion', 'grade': 10},
      ]
    },
    {
      'text': 'What is your teacher favorite?',
      'response': [
        {'text': 'Lucas', 'grade': 10},
        {'text': 'Gabriela', 'grade': 9},
        {'text': 'Rafaela', 'grade': 8},
      ]
    }
  ];

  void _whenReply(int grade) {
    if (isAnswerSelected) {
      setState(() {
        _answerSelected++;
        _totalGrade += grade;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _answerSelected = 0;
      _totalGrade = 0;
    });
  }

  bool get isAnswerSelected {
    return _answerSelected < _answers.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'Quiz',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: isAnswerSelected
            ? Quiz(
                answers: _answers,
                answerSelected: _answerSelected,
                whenReply: _whenReply,
              )
            : Result(
                totalGrade: _totalGrade,
                whenRestartQuiz: _restartQuiz,
              ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}

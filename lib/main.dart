import 'package:flutter/material.dart';
import 'package:quiz/Answer.dart';
import 'package:quiz/response.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _answerSelected = 0;

  void _reply() {
    setState(() {
      _answerSelected++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final answers = [
      {
        'text': 'What is your color favorite?',
        'response': ['red', 'blue', 'black']
      },
      {
        'text': 'What is your animal favorite?',
        'response': ['dog', 'cat', 'lion']
      },
      {
        'text': 'What is your teacher favorite?',
        'response': ['Lucas', 'Gabriela', 'Rafaela']
      }
    ];

    List<String> answerList = answers[_answerSelected].cast()['response'];

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
          body: Column(
            children: [
              Answer(answers[_answerSelected]['text'].toString()),
              ...answerList.map((text) => Response(text, _reply)).toList(),
            ],
          )),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}

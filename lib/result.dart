import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalGrade;
  final void Function() whenRestartQuiz;

  const Result({
    super.key,
    required this.totalGrade,
    required this.whenRestartQuiz,
  });

  String get resultResponse {
    if (totalGrade < 20) {
      return 'Congratulations!';
    } else if (totalGrade < 24) {
      return 'Very good!';
    } else if (totalGrade < 30) {
      return 'Spectacular!';
    } else {
      return 'Level Maddytec';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultResponse,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: const Text(
            'Wanna give it another shot?',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          onPressed: whenRestartQuiz,
        ),
      ],
    );
  }
}

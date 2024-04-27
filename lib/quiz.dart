import 'package:flutter/material.dart';
import 'package:quiz/Answer.dart';
import 'package:quiz/response.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> answers;
  final int answerSelected;
  final void Function(int) whenReply;

  const Quiz({
    required this.answers,
    required this.answerSelected,
    required this.whenReply,
  });

  bool get isAnswerSelected {
    return answerSelected < answers.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answerList = isAnswerSelected
        ? answers[answerSelected].cast()['response']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Answer(answers[answerSelected]['text'].toString()),
        ...answerList.map((response) {
          return Response(
            response['text'] as String,
            () => whenReply(int.parse(response['grade'].toString())),
          );
        }).toList(),
      ],
    );
  }
}

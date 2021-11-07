import 'package:flutter/material.dart';
import 'package:QnA/answer.widget.dart';
import 'package:QnA/question.widget.dart';

class Questionary extends StatelessWidget {
  final int askIndex;
  final List<Map<String, Object>> asks;
  final Function(int) onAnswer;

  const Questionary(
      {Key? key,
      required this.askIndex,
      required this.asks,
      required this.onAnswer})
      : super(key: key);

  bool get _hasAnswers => askIndex < asks.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        _hasAnswers ? asks[askIndex].cast()['answers'] : [];

    return Column(
      children: [
        Question(title: asks[askIndex]['text'].toString()),
        ...answers.map((response) {
          return Answer(
            text: response['text'].toString(),
            onPress: () => onAnswer(
              int.parse(
                response['score'].toString(),
              ),
            ),
          );
        })
      ],
    );
  }
}

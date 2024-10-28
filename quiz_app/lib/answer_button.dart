import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white),
      onPressed: onTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}

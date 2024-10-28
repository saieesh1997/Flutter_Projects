import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
  final void Function(String answer) onSelectAnswer;
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                  answerText: item,
                  onTap: () {
                    answerQuestion(item);
                  });
            }),
            // AnswerButton(answerText: 'Answer 1', onTap: () {}),
            // AnswerButton(answerText: 'Answer 2', onTap: () {}),
            // AnswerButton(answerText: 'Answer 3', onTap: () {}),
            // AnswerButton(answerText: 'Answer 4', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

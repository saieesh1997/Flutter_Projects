import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  List<String> selectedAnswers = [];
  var activescreen = 'Start-Screen';

  void switchScreen() {
    setState(() {
      activescreen = 'Question-Screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activescreen = 'Result-Screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activescreen = 'Question-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget screenWidget = StartScreen(switchScreen);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activescreen == 'Start-Screen'
                ? StartScreen(switchScreen)
                : activescreen == 'Question-Screen'
                    ? QuestionsScreen(onSelectAnswer: chooseAnswers)
                    : ResultScreen(
                        chosenAnswers: selectedAnswers,
                        onRestart: restartQuiz)),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BallPage(),
  ));
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 26, 207),
          title: const Text(
            'Ask Me Anything',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Ball());
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      child: Image.asset('images/ball$ballNumber.png'),
      onPressed: () {
        setState(() {
           ballNumber = Random().nextInt(4)+1;
        });
      },
    ));
  }
}

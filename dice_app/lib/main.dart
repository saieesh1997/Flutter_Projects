import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceRoller());
}

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/dice-$currentDiceRoll.png',
                width: 200,
              ),
              const SizedBox(
                height: 40.00,
              ),
              ElevatedButton(
                onPressed: rollDice,
                style: ElevatedButton.styleFrom(
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.brown,
                  textStyle: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                child: const Text('Roll Dice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

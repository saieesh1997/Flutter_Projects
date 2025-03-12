import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'I AM POOR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.asset('images/diamond.png'),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

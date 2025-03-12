import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Logic
class _HomePageState extends State<HomePage> {
  AssetImage cross = const AssetImage("images/cross.png");
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage edit = const AssetImage("images/edit.png");

  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      message = "";
    });
  }

  playGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
          isCross = false;
        } else {
          gameState[index] = "circle";
          isCross = true;
        }
        // this.isCross = !this.isCross;
        checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;

      case ('cross'):
        return cross;

      case ('circle'):
        return circle;
    }
    return edit;
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = '${gameState[0]} Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = '${gameState[3]} Wins';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = '${gameState[6]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = '${gameState[0]} Wins';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = '${gameState[1]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = '${gameState[2]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        message = '${gameState[0]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = '${gameState[2]} Wins';
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        message = 'Game Draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
            padding: const EdgeInsets.all(20.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: gameState.length,
            itemBuilder: (context, i) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                onPressed: () {
                  playGame(i);
                },
                child: Image(image: getImage(gameState[i])),
              ),
            ),
          )),
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(message,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ))),
          MaterialButton(
              color: Colors.purple,
              child: const Text("Reset Game"),
              onPressed: () {
                resetGame();
              }),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Learn Code Online",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}

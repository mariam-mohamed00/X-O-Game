import 'package:flutter/material.dart';
import 'package:xo_game/board_button.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = 'Game Board';

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> boardSatat = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int scorePlayer1 = 0;
  int scorePlayer2 = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)?.settings.arguments as GameBoardArgs;

    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(),
        title: Text('XO Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1Name} (X)',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$scorePlayer1',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player2Name} (O)',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$scorePlayer2',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardSatat[0],
                  index: 0,
                  onButtonClick: onButtonClick,
                ),
                BoardButton(
                    text: boardSatat[1],
                    index: 1,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardSatat[2],
                    index: 2,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardSatat[3],
                    index: 3,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardSatat[4],
                    index: 4,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardSatat[5],
                    index: 5,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardSatat[6],
                    index: 6,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardSatat[7],
                    index: 7,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardSatat[8],
                    index: 8,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*
  0 => X
  1 => O
  2 => X
  3 => O
  4 => X
  5 => O
  6 => X
  7 => O
  8 => X
   */
  int counter = 0;

  void onButtonClick(index) {
    if (boardSatat[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardSatat[index] = 'X';
    } else {
      boardSatat[index] = 'O';
    }
    counter++;

    if (checkWinner('X')) {
      scorePlayer1++;
      initBoard();
    } else if (checkWinner('O')) {
      scorePlayer2++;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardSatat[i] == symbol &&
          boardSatat[i + 1] == symbol &&
          boardSatat[i + 2] == symbol) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (boardSatat[i] == symbol &&
          boardSatat[i + 3] == symbol &&
          boardSatat[i + 6] == symbol) {
        return true;
      }
    }

    if (boardSatat[0] == symbol &&
        boardSatat[4] == symbol &&
        boardSatat[8] == symbol) {
      return true;
    }

    if (boardSatat[2] == symbol &&
        boardSatat[4] == symbol &&
        boardSatat[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardSatat = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }
}

class GameBoardArgs {
  String player1Name;

  String player2Name;

  GameBoardArgs({required this.player1Name, required this.player2Name});
}

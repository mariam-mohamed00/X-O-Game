import 'package:flutter/material.dart';
import 'package:xo_game/game_board.dart';

class PlayersScreen extends StatelessWidget {
  static const String routeName = 'Players Screen';
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To Route Games'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              onChanged: (text) {
                player1Name = text;
              },
              decoration: InputDecoration(
                label: Text('Player1 Name:'),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              onChanged: (text) {
                player2Name = text;
              },
              decoration: InputDecoration(
                  label: Text('Player2 Name:'),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, GameBoard.routeName,
                      arguments: GameBoardArgs(
                          player1Name: player1Name, player2Name: player2Name));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  elevation: 0,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Let's Play",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

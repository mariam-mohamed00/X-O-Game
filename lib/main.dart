import 'package:flutter/material.dart';
import 'package:xo_game/game_board.dart';
import 'package:xo_game/players_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayersScreen.routeName,
      routes: {
        GameBoard.routeName: (contex) => GameBoard(),
        PlayersScreen.routeName: (context) => PlayersScreen(),
      },
    );
  }
}

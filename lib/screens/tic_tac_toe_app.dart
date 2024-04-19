import 'package:flutter/material.dart';
import 'tic_tac_toe_game.dart';

class TicTacToeApp extends StatefulWidget {
  @override
  State<TicTacToeApp> createState() => _TicTacToeAppState();
}

class _TicTacToeAppState extends State<TicTacToeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeGame(),
    );
  }
}

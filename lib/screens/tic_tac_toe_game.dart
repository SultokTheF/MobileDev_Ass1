import 'package:flutter/material.dart';
import '../logic/tic_tac_toe_logic.dart';

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  late TicTacToeLogic _gameLogic;

  @override
  void initState() {
    super.initState();
    _gameLogic = TicTacToeLogic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              'Current Player: ${_gameLogic.currentPlayer}',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                final row = index ~/ 3;
                final col = index % 3;
                return GestureDetector(
                  onTap: () => _gameLogic.onCellTapped(row, col, () {
                    setState(() {});
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        _gameLogic.board[row][col],
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () {
                _gameLogic.resetGame();
                setState(() {});
              },
              child: Text('Reset Game'),
            ),
          ),
        ],
      ),
    );
  }
}

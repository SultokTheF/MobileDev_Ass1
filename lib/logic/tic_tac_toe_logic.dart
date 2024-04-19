class TicTacToeLogic {
  List<List<String>> board = [];
  String currentPlayer = '';

  TicTacToeLogic() {
    initializeGame();
  }

  void initializeGame() {
    board = List.generate(3, (_) => List.filled(3, ''));
    currentPlayer = 'X';
  }

  void onCellTapped(int row, int col, Function callback) {
    if (board[row][col].isEmpty) {
      board[row][col] = currentPlayer;
      currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';

      String winner = checkForWinner();
      if (winner.isNotEmpty) {
        // Notify UI to update when game is over
        callback();
      }
    }
  }

  String checkForWinner() {
    // Check rows for a win
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0].isNotEmpty) {
        return board[i][0];
      }
    }

    // Check columns for a win
    for (int i = 0; i < 3; i++) {
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i].isNotEmpty) {
        return board[0][i];
      }
    }

    // Check diagonals for a win
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      return board[0][0];
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      return board[0][2];
    }

    // Check for a draw
    bool isDraw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          isDraw = false;
          break;
        }
      }
    }
    if (isDraw) {
      return 'Draw';
    }

    // No winner yet
    return '';
  }

  void resetGame() {
    initializeGame();
  }
}

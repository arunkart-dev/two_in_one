import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gamescreen extends StatefulWidget {
  String player1 = '';
  String player2 = '';
  Gamescreen({super.key, required this.player1, required this.player2});
  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  late List<List<String>> _board;
  late String _currentplayer;
  late String _winner;
  late bool _gameover;
  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentplayer = "X";
    _winner = "";
    _gameover = false;
  }

  //ResetGame

  void _resetgame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentplayer = "X";
      _winner = "";
      _gameover = false;
    });
  }

  void _makemove(int row, int col) {
    if (_board[row][col] != "" || _gameover) {
      return;
    }
    setState(() {
      _board[row][col] = _currentplayer;
      //check for winner
      if (_board[row][0] == _currentplayer &&
          _board[row][1] == _currentplayer &&
          _board[row][2] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][col] == _currentplayer &&
          _board[1][col] == _currentplayer &&
          _board[2][col] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][0] == _currentplayer &&
          _board[1][1] == _currentplayer &&
          _board[2][2] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      } else if (_board[0][2] == _currentplayer &&
          _board[1][1] == _currentplayer &&
          _board[2][0] == _currentplayer) {
        _winner = _currentplayer;
        _gameover = true;
      }

      //switchplayers
      _currentplayer = _currentplayer == "X" ? "O" : "X";

      //check for a tie

      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _gameover = true;
        _winner = "It is a tie";
      }

      if (_winner != "") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          btnOkText: "Play Again",
          title:
              _winner == "X"
                  ? "${widget.player1}Won!"
                  : _winner == "O"
                  ? "${widget.player2}Won!"
                  : "It is a tie",
          btnOkOnPress: () {
            _resetgame();
          },
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323D5B),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('GameScreen !!'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Turn: ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        _currentplayer == 'X'
                            ? widget.player1 + "  ($_currentplayer) "
                            : widget.player2 + "($_currentplayer)",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentplayer == "X"
                                  ? Color(0xFFE25041)
                                  : Color(0xFF1CBD9E),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF5F6B84),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => _makemove(row, col),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFF0E1E3A),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(_board[row][col],
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: _board[row][col] == "X"?Color(0xFFE25041):Color(0xFF1CBD9E)
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

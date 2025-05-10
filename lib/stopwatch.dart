import 'dart:async';

import 'package:flutter/material.dart';

class StWatch extends StatefulWidget {
  const StWatch({super.key});

  @override
  State<StWatch> createState() => _StWatchState();
}

class _StWatchState extends State<StWatch> {
  late Timer _timer;
  int _seconds = 0;
  bool _isrunning = false;

  void start() {
    if (!_isrunning) {
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {
          _seconds++;
        });
        setState(() {
          _isrunning = true;
        });
      });
    }
  }

  void stop() {
    if (_isrunning) {
      _timer.cancel();
      setState(() {
        _isrunning = false;
      });
    }
  }

  void reset() {
    _timer.cancel();
    setState(() {
      _seconds = 0;
      _isrunning = false;
    });
  }

  void _resetstopwatch() {
    _timer.cancel();
    setState(() {
      _seconds = 0;
      _isrunning = false;
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')} : '
        '${minutes.toString().padLeft(2, '0')} : '
        '${secs.toString().padLeft(2, '0')} : ';
  }

  @override
  void dispose() {
    if (_isrunning) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Stopwatch'),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(45)
                ),
                child: Text(_formatTime(_seconds),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),)
                ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isrunning?stop:start,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(120, 30),
                      padding: EdgeInsets.all(10)
                    ),
                     child: Text(_isrunning?'Stop':'Start')
                     ),
                     SizedBox(width: 20,),
                     ElevatedButton(
                      onPressed: _resetstopwatch,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: Size(120, 30),
                        padding: EdgeInsets.all(10)
                      ),
                       child: Text('Reset')
                       )
                ],
              )
          ],
        ),
      )
    );
  }
}

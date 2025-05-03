import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void increase() {
    setState(() {
      _counter++;
    });
  }

  void decrease() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Counter'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_counter.toString(), style: TextStyle(fontSize: 35)),
            SizedBox(height: 440),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    increase();
                  },
                  backgroundColor: Colors.green,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    decrease();
                  },
                  backgroundColor: Colors.red,
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

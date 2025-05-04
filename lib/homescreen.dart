import 'package:flutter/material.dart';
import 'package:two_in_one/counter.dart';
import 'package:two_in_one/currencyconvert.dart';
import 'package:two_in_one/notes.dart';
import 'package:two_in_one/taskmanager.dart';
import 'package:two_in_one/tictactoe.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Two in one'),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Taskmanager()),
                );
              },
              child: Card(
                color: Colors.lightBlue,
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 30,
                  ),
                  child: Text(
                    'To do list',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tictactoe()),
                );
              },
              child: Card(
                color: Colors.lightBlue,
                elevation: 6.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  child: Text(
                    'Tic Tac Toe',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter()),
                );
              },
              child: Card(
                color: Colors.lightBlue,
                elevation: 6.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  child: Text(
                    'Counter App',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Currencyconvert()));
              },
              child: Card(
                color: Colors.lightBlue,
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Text(
                    'Currency Converter',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes()));
              },
              child: Card(
                color: Colors.lightBlue,
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 30,
                  ),
                  child: Text(
                    'Notes App',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

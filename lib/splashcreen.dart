import 'dart:async';

import 'package:flutter/material.dart';
import 'package:two_in_one/homescreen.dart';

class Splashcreen extends StatefulWidget {
  const Splashcreen({super.key});

  @override
  State<Splashcreen> createState() => _SplashcreenState();
}

class _SplashcreenState extends State<Splashcreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 51, 92),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(
            'https://www.shutterstock.com/shutterstock/photos/757771723/display_1500/stock-vector-vector-illustration-sign-numbers-two-in-one-isolated-on-white-background-figures-in-icon-of-757771723.jpg',
          ),
        ),
      ),
    );
  }
}

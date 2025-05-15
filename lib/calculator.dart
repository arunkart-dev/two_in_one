import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? first, second;
  String res = "", text = "";
  String opp = "";
  void onclick(String btntext) {
    if (btntext == "C") {
      res = "";
      first = 0;
      second = 0;
      text = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "X" ||
        btntext == "/") {
      first = int.parse(text);
      res = "";
      opp = btntext;
    } else if (btntext == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first! + second!).toString();
      }
      if (opp == "-") {
        res = (first! - second!).toString();
      }
      if (opp == "X") {
        res = (first! * second!).toString();
      }
      if (opp == "/") {
        res = (first! / second!).toString();
      } 
    } else {
        res =text + btntext;
      }
      setState(() {
        text = res;
      });
  }

  Widget custombutton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => onclick(val),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(25),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white
        ),
         child: Text(val,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)
         ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Calculator'),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: Text(text, style: TextStyle(fontSize: 50)),
              ),
            ),
            Row(
              spacing: 10.0,
              children: [
                SizedBox(width: 10,),
                  custombutton('9'),
                  custombutton('8'),
                  custombutton('7'),
                  custombutton('+'),
                  SizedBox(width: 10,)
                ],
               ),
               SizedBox(height: 20,),
               Row(
                spacing: 10,
                children: [
                  SizedBox(width: 10,),
                  custombutton('6'),
                  custombutton('5'),
                  custombutton('4'),
                  custombutton('-'),
                  SizedBox(width: 10,)
                ],
               ),
               SizedBox(height: 20,),
                Row(
                spacing: 10,
                children: [
                  SizedBox(width: 10,),
                  custombutton('3'),
                  custombutton('2'),
                  custombutton('1'),
                  custombutton('X'),
                  SizedBox(width: 10,)
                ],
               ),
               SizedBox(height:20,),
               Row(
                spacing: 10,
                children: [
                  SizedBox(width: 10,),
                  custombutton('C'),
                  custombutton('0'),
                  custombutton('/'),
                  custombutton('='),
                  SizedBox(width: 10,)
                ],
               ),
               SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

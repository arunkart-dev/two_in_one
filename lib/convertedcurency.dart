import 'package:flutter/material.dart';

class Convertedcurency extends StatefulWidget {
  const Convertedcurency({super.key});

  @override
  State<Convertedcurency> createState() => _ConvertedcurencyState();
}

class _ConvertedcurencyState extends State<Convertedcurency> {
  final TextEditingController _currencycontroller = TextEditingController();
  String? res;
  void convert() {
    double a = double.parse(_currencycontroller.text);
    double b = 85;
    setState(() {
      res = (a * b).toStringAsFixed(2);
    });
  }

  void euro() {
    double d = double.parse(_currencycontroller.text);
    double c = 95.76;
    setState(() {
      res = (d * c).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Rupees to dollars'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            spacing: 45,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _currencycontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money),
                  label: Text('Dollars'),
                  hintText: 'Enter dollars',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  convert();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(300, 40),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Convert dollar to ruppees'),
              ),
               ElevatedButton(
                onPressed: () {
                  euro();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(300, 40),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Convert euro to ruppees'),
              ),
              if (res != null)
                Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${res!}  In ruppees',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

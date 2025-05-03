
import 'package:flutter/material.dart';

class Convertedcurency extends StatefulWidget {
  const Convertedcurency({super.key});

  @override
  State<Convertedcurency> createState() => _ConvertedcurencyState();
}

class _ConvertedcurencyState extends State<Convertedcurency> {
  final TextEditingController _currencycontroller = TextEditingController();
  String ?res;
  void convert() {
    double a = double.parse(_currencycontroller.text);
    double b = 85;
    setState(() {
      res = (a * b).toStringAsFixed(2);
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
                  label: Text('Indian ruppees'),
                  hintText: 'Enter ruppees',
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
                child: Text('Convert to dollars'),
              ),
              if(res != null)
              Card(
                color: Colors.white,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('${res!}  In dollars',style: TextStyle(fontSize: 25,color: Colors.red),),
                )
                )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:calc/km_to_mile_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  operation(String btntext) {
    if (btntext == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btntext == "+" || btntext == "-" || btntext == "x" || btntext == "/") {
      num1 = double.parse(output);
      operand = btntext;
      _output = "0";
    } else if (btntext == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }

      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + btntext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String btntext) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 2),
        fillColor: Colors.black,
        padding: EdgeInsets.all(28.0),
        splashColor: Colors.white,
        child: Text(
          "$btntext",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        elevation: 20.0,
        onPressed: () {
          operation(btntext);
        },
      ),
    );
  }

  Widget convertButton(String fromUnit, String toUnit) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 2),
        fillColor: Colors.black,
        padding: EdgeInsets.all(28.0),
        splashColor: Colors.white,
        child: Text(
          "Convert $fromUnit to $toUnit",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        elevation: 20.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KmToMileConverter()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text("$output",
                      style:
                      TextStyle(fontSize: 50, fontWeight: FontWeight.w600)),
                ),
              ),
              Row(
                children: [
                  button("9"),
                  SizedBox(width: 5),
                  button("8"),
                  SizedBox(width: 5),
                  button("7"),
                  SizedBox(width: 5),
                  button("/"),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("4"),
                  SizedBox(width: 5),
                  button("5"),
                  SizedBox(width: 5),
                  button("6"),
                  SizedBox(width: 5),
                  button("x"),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("3"),
                  SizedBox(width: 5),
                  button("2"),
                  SizedBox(width: 5),
                  button("1"),
                  SizedBox(width: 5),
                  button("-"),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("0"),
                  SizedBox(width: 5),
                  button("AC"),
                  SizedBox(width: 5),
                  button("="),
                  SizedBox(width: 5),
                  button("+"),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  convertButton("Kilometers", "Miles"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
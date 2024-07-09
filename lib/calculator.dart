import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculator1 extends StatefulWidget {
  const Calculator1({super.key});

  @override
  State<Calculator1> createState() => _Calculator1State();
}

class _Calculator1State extends State<Calculator1> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        if (kDebugMode) {
          print("already contains decimal");
        }
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    if (kDebugMode) {
      print(_output);
    }
    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(150, 23, 32, 43),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black54,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Expanded(
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("*"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildButton("Clear"),
                      ),
                      Expanded(
                        child: buildButton("="),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: Calculator1()));

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATER',
      theme: ThemeData(
        backgroundColor: Colors.blue[100],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyOwnPage();
}

class MyOwnPage extends State<HomePage> {
  String output = "0";

  String _output = "0";
  double value1 = 0.0;
  double value2 = 0.0;
  String operation = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      value1 = 0.0;
      value2 = 0.0;
      operation = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      value1 = double.parse(output);
      operation = buttonText;
      _output = "0";
    } else if (_output.contains(".")) {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = output + buttonText;
      }
    } else if (buttonText == "=") {
      value2 = double.parse(output);
      if (operation == "+") {
        _output = (value1 + value2).toString();
      }
      if (operation == "-") {
        _output = (value1 - value2).toString();
      }
      if (operation == "/") {
        _output = (value1 / value2).toString();
      }
      if (operation == "*") {
        _output = (value1 * value2).toString();
      }

      value1 = 0.0;
      value2 = 0.0;
      operation = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildBotton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        child: Text(
          buttonText,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ), //We've created it as a static text

        onPressed: () => buttonPressed(buttonText),
        textColor: Colors.black,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculater",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 12.0,
              ),
              alignment: Alignment.topRight,
              child: Text(
                output,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildBotton("7"),
                    buildBotton("8"),
                    buildBotton("9"),
                    buildBotton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildBotton("4"),
                    buildBotton("5"),
                    buildBotton("6"),
                    buildBotton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildBotton("1"),
                    buildBotton("2"),
                    buildBotton("3"),
                    buildBotton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildBotton("."),
                    buildBotton("00"),
                    buildBotton("("),
                    buildBotton(")"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildBotton("CLEAR"),
                    buildBotton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

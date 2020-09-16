import 'package:flutter/material.dart';
import 'button.dart';
import 'resultBord.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: IosCalc(),
    );
  }
}

class IosCalc extends StatefulWidget {
  @override
  IosCalcState createState() => IosCalcState();
}

class IosCalcState extends State<IosCalc> {
  double _oldNumber = 0, _currentNumber = 0;
  String _operators = '', _borderNumber = '';

  void _resetCalc() {
    _oldNumber = 0;
    _currentNumber = 0;
    _borderNumber = '';
    _setBorderNumber('');
    _operators = '';
  }

  void _setOperator(String op) {
    if (_borderNumber != '') _setNumber(double.parse(_borderNumber));
    if (_oldNumber != 0) {
      _operators = op;
      _borderNumber = '';
      _setBorderNumber('');
    }
  }

  void _setBorderNumber(String strNumber) {
    setState(() {
      _borderNumber += strNumber;
    });
  }

  void _setNumber(double number) {
    if (_oldNumber == 0)
      _oldNumber = number;
    else
      _currentNumber = number;
  }

  void _equal() {
    if (_borderNumber != '') {
      _setNumber(double.parse(_borderNumber));
      _calculate();
    }
  }

  void _calculate() {
    String result;
    switch (_operators) {
      case '/':
        result = (_currentNumber == 0.0)
            ? 'Infinity'
            : (_oldNumber / _currentNumber).toString();
        break;
      case 'x':
        result = (_oldNumber * _currentNumber).toString();
        break;
      case '+':
        result = (_oldNumber + _currentNumber).toString();
        break;
      case '-':
        result = (_oldNumber - _currentNumber).toString();
        break;
    }
    _resetCalc();
    _setBorderNumber(result);
  }

  void flipSign() {
    if (_borderNumber != '') {
      double number = double.parse(_borderNumber);
      number = -number;
      _borderNumber = '';
      _setBorderNumber(number.toString());
    }
  }

  void _percentageNumber() {
    if (_borderNumber != '') {
      double number = double.parse(_borderNumber);
      number = number / 100;
      _borderNumber = '';
      _setBorderNumber(number.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ResultBord(_borderNumber),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button('C', const Color(0xffa5a5a5), _resetCalc),
              Button('+/-', const Color(0xffa5a5a5), flipSign),
              Button('%', const Color(0xffa5a5a5), _percentageNumber),
              Button('/', Colors.orange, _setOperator),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button('7', const Color(0xff333333), _setBorderNumber),
              Button('8', const Color(0xff333333), _setBorderNumber),
              Button('9', const Color(0xff333333), _setBorderNumber),
              Button('x', Colors.orange, _setOperator),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button('4', const Color(0xff333333), _setBorderNumber),
              Button('5', const Color(0xff333333), _setBorderNumber),
              Button('6', const Color(0xff333333), _setBorderNumber),
              Button('-', Colors.orange, _setOperator),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button('1', const Color(0xff333333), _setBorderNumber),
              Button('2', const Color(0xff333333), _setBorderNumber),
              Button('3', const Color(0xff333333), _setBorderNumber),
              Button('+', Colors.orange, _setOperator),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button('0', const Color(0xff333333), _setBorderNumber),
              Button('.', const Color(0xff333333), _setBorderNumber),
              Button('=', Colors.orange, _equal),
            ],
          ),
        ],
      ),
    );
  }
}
